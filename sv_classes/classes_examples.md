# Classes examples 

A SystemVerilog class is an Object Oriented Programming concept that is used 
to encapsulate data (property) and functions/tasks (methods) that operate on data.

class myPacket;
	bit [2:0]  header;
	bit        encode;
	bit [2:0]  mode;
	bit [7:0]  data;
	bit        stop;
	
	function new (bit [2:0] header = 3'h1, bit [2:0] mode = 5);
		this.header = header;
		this.encode = 0;
		this.mode   = mode;
		this.stop   = 1;
	endfunction
	
	function display ();
		$display ("Header = 0x%0h, Encode = %0b, Mode = 0x%0h, Stop = %0b", 
		           this.header, this.encode, this.mode, this.stop);
	endfunction
endclass

Note the points : <br/>
function new () is called the constructor and is automatically called upon object creation.<br/>
<b>this</b> keyword is used to refer to the current class. Normally used within a class to refer to its own properties/methods.<br/>
<b><i>display ()</i></b> is a function, and rightly so, because displaying values does not consume simulation time.<br/>
function new ()has default values to the arguments, and hence line 6 (below) will create a packet object with values<br/>

<h2>How can I access signals within a class ?<br/>
To do that, you have to create an <i><b>object</b></i> of the class, which can be used as a handle to its properties and methods.
