import re
import sys

def split_asserts(input_file):
    with open(input_file, 'r') as f:
        content = f.read()
    
    # 匹配assert语句（支持多行，包含else子句）
    pattern = 
    matches = list(re.finditer(pattern, content))
    
    if not matches:
        print("未找到assert语句")
        return
    
    base_name = input_file.rsplit('.', 1)[0]
    
    for i, match in enumerate(matches):
        new_content = []
        last_pos = 0
        
        # 重建内容，仅保留当前assert
        for j, m in enumerate(matches):
            new_content.append(content[last_pos:m.start()])  # 添加非assert内容
            if j == i:
                new_content.append(content[m.start():m.end()])  # 保留当前assert
            last_pos = m.end()
        
        new_content.append(content[last_pos:])  # 添加最后一段
        new_content = ''.join(new_content)
        
        # 写入新文件
        output_file = f"{base_name}_assert{i+1}.sv"
        with open(output_file, 'w') as f:
            f.write(new_content)
        print(f"生成文件: {output_file}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("用法: python split_asserts.py <输入文件.sv>")
        sys.exit(1)
    
    split_asserts(sys.argv[1])
