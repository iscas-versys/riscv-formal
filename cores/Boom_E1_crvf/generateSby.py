import os

template = """[options]
mode bmc
depth 21
skip 20

[engines]
smtbmc boolector

[script]
read_verilog -sv Core.v
read_verilog -sv define.sv
read_verilog -sv SimTop.sv
read_verilog -sv DifftestArchEvent.v
read_verilog -sv DifftestTrapEvent.v 
read_verilog -sv DifftestCSRState.v 
read_verilog -sv DifftestArchIntRegState.v 
read_verilog -sv DifftestInstrCommit.v 
read_verilog -sv MemRWHelper.v
{}
prep -top Core

[files]
SimTop.sv
define.sv
Core.v
DifftestArchEvent.v
DifftestArchIntRegState.v 
DifftestCSRState.v 
DifftestInstrCommit.v 
DifftestTrapEvent.v 
MemRWHelper.v"""

for i in range(1, 17):
    new_command = f"chformal -remove -assert c:A{i} %n"
    new_content = template.format(new_command)
    
    filename = f"SimTop_A{i}.sby"
    with open(filename, 'w') as f:
        f.write(new_content)
    print(f"生成文件: {filename}")
