# What are classes ?

<p>class is a user-defined datatype, an OOP construct, that can be used to encapsulate data (property) and tasks/functions (methods) which operate on the data.</p>



# Classes examples 

A SystemVerilog class is an Object Oriented Programming concept that is used 
to encapsulate data (property) and functions/tasks (methods) that operate on data.<br/>


<pre> <code>
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
</pre> </code><br/>

Note the points : <br/>
function new () is called the constructor and is automatically called upon object creation.<br/>
<b>this</b> keyword is used to refer to the current class. Normally used within a class to refer to its own properties/methods.<br/>
<b><i>display ()</i></b> is a function, and rightly so, because displaying values does not consume simulation time.<br/>
function new ()has default values to the arguments, and hence line 6 (below) will create a packet object with values<br/>

How can I access signals within a class ?<br/>
To do that, you have to create an <i><b>object</b></i> of the class, which can be used as a handle to its properties and methods.<br/>
<pre> <code>
	module tb_top;
	myPacket pkt0, pkt1;
		
	initial begin
		pkt0 = new (3'h2, 2'h3);
		pkt0.display ();
		
		pkt1 = new ();
		pkt1.display ();
	end
endmodule 
</pre> </code>
<b>How do I create an array of classes ?</b><br/>
<p>An array of classes can be created in a way similar to how you create an <code>int</code> type array.</p><br/>

<pre> <code>
	module tb_top;
	myPacket pkt0 [3];
	
	initial begin
    	for(int i = 0; i < $size (pkt0); i++) begin
   	   		pkt0[i] = new ();
       		pkt0[i].display ();
   		end
   	end
endmodule
</pre> </code>

<h2>What is inheritance ?</h2><p>Let's say you wanted to have a class with all the properties/methods of <code>myPacket</code> and be able to add more stuff in it without changing <code>myPacket</code>, the best way to do so is by <i>inheritance</i>. In the example below, networkPacket inherits the properties/methods of myPacket using the <code>extend</code> keyword. To call the functions of base class (myPacket), use <code>super</code> keyword.</p><pre>  <code class="language-verilog match-braces line-numbers">
class networkPkt extends myPacket;
	bit        parity;
	bit [1:0]  crc;
	
	function new ();
		super.new ();
		this.parity = 1;
		this.crc = 3;
	endfunction
	
	function display ();
		super.display();
		$display ("Parity = %0b, CRC = 0x%0h", this.parity, this.crc);
	endfunction
endclass

</pre> </code>
