# sv

Command line of visual code 

https://code.visualstudio.com/docs/editor/command-line

Xilinx vivado add to path in ubuntu


gedit ~/.profile

add to last line 
export PATH=$PATH:/home/student/xilinx/tools/Vivado/2021.2/bin

to invoke vscode from the terminal 
code

type in terminal
xvlog  -sv svrand.sv 
xelab  -debug typical tb -s top_sim
xsim  top_sim -t xsim_run.tcl  [xsim  top_sim  this also will do]

The following commands are with full path

/home/student/xilinx/tools/Vivado/2021.2/bin/xvlog  -sv svrand.sv 
/home/student/xilinx/tools/Vivado/2021.2/bin/xelab  -debug typical tb -s top_sim
/home/student/xilinx/tools/Vivado/2021.2/bin/xsim  top_sim -t xsim_run.tcl
