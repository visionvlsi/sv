# sv

Command line of visual code 

https://code.visualstudio.com/docs/editor/command-line

Xilinx vivado add to path in ubuntu


gedit ~/.profile

add to last line 
export PATH=$PATH:/home/student/xilinx/tools/Vivado/2021.2/bin

to invoke vscode from the terminal<br/>
code

type in terminal

<li>
 <ol>xvlog  -sv svrand.sv </ol>
 <ol>xelab  -debug typical tb -s top_sim</ol>
<ol>xsim  top_sim -t xsim_run.tcl  [xsim  top_sim  this also will do]</ol>
</li>

The following commands are with full path

<li>
 <ol>/home/student/xilinx/tools/Vivado/2021.2/bin/xvlog  -sv svrand.sv </ol>
<ol>/home/student/xilinx/tools/Vivado/2021.2/bin/xelab  -debug typical tb -s top_sim </ol>
<ol>/home/student/xilinx/tools/Vivado/2021.2/bin/xsim  top_sim -t xsim_run.tcl </ol>


[IEEE Standard for SystemVerilog—
Unified Hardware Design,
Specification, and Verification
Language](https://drive.google.com/file/d/1ZBCmIYxE_mlNlnBnHTBBoZ19CYvoxKpQ/view?usp=drive_link)
