import subprocess
import threading
import time
from concurrent.futures import ThreadPoolExecutor

# 全局状态控制
failed_event = threading.Event()
start_time = None
failed_command = None

def run_sby(command):
    global failed_command
    proc = subprocess.Popen(
        command.split(),
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        bufsize=1
    )

    while proc.poll() is None and not failed_event.is_set():
        line = proc.stdout.readline()
        if not line:
            continue
        print(f"[{command}] {line.strip()}")  # 实时输出日志

        if "DONE (FAIL," in line:
            with threading.Lock():
                if not failed_event.is_set():
                    failed_event.set()
                    failed_command = command
                    proc.terminate()

def main():
    global start_time
    commands = [f"sby SimTop_A{i}.sby -f" for i in range(1, 17)]

    start_time = time.time()
    with ThreadPoolExecutor(max_workers=16) as executor:  # 设置并发数
        futures = [executor.submit(run_sby, cmd) for cmd in commands]

        while not failed_event.is_set():
            if all(fut.done() for fut in futures):
                break
            time.sleep(0.1)

    elapsed = time.time() - start_time
    if failed_event.is_set():
        print(f"\n[FAILED] 命令 {failed_command} 触发失败，总运行时间: {elapsed:.2f}秒")
        exit(1)
    else:
        print(f"\n[SUCCESS] 所有任务完成，总运行时间: {elapsed:.2f}秒")

if __name__ == "__main__":
    main()

