import re
import sys

def process_asserts(file_path):
    # 读取整个文件内容（处理多行断言）
    with open(file_path, 'r') as f:
        content = f.read()

    # 匹配SystemVerilog assert语句的正则表达式
    # 支持多行断言和不同格式（包含property/sequence等情况）
    pattern = r'''
        (                           # 分组1：前置空白/注释
            (?:^[ \t]*)             # 行首空白
            | (?<=\})               # 或前导闭合括号
            | (?<=\;)\s*            # 或分号后的空白
        )
        (assert\s+                  # assert关键字
        (?:property|sequence|)\s*    # 可能的后缀关键字
        $[^;]*?$\s*;              # 参数部分（非贪婪匹配）
        )
        (?=\s*(//|/\*|$))           # 后跟注释或行尾
    '''

    global counter
    counter = 1
    last_pos = 0
    output = []

    # 使用正则表达式查找所有匹配项
    for match in re.finditer(pattern, content, re.VERBOSE | re.IGNORECASE | re.DOTALL):
        # 获取匹配区间
        start, end = match.span()
        # 添加前缀
        new_text = f"/* A{counter} */ {match.group()}"
        # 更新计数器
        counter += 1
        # 构建输出内容
        output.append(content[last_pos:start])
        output.append(new_text)
        last_pos = end

    # 添加剩余内容
    output.append(content[last_pos:])

    # 写回文件（建议先备份原文件）
    with open(file_path, 'w') as f:
        f.write(''.join(output))

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python sv_assert_counter.py <filename.sv>")
        sys.exit(1)

    process_asserts(sys.argv[1])
    print(f"Processed {sys.argv[1]} with {counter-1} assert statements marked.")
