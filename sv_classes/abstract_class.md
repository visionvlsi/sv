#  SystemVerilog Abstract Class 

SystemVerilog prohibits a class declared as virtual  to be directly instantiated and is called an abstract  class. <br/>
# Syntax
<pre><code>
virtual class <class-name>
	// class definition
endclass

</code></pre>
  
  <p>However, this class can be extended to form other sub-classes which can then be instantiated. This is useful to enforce testcase developers to always extend a base class to form another class for their needs. So <i>base</i> classes are usually declared as<code>virtual</code> although it is not mandatory.</p>
  
  <h2>Normal Class Example</h2><pre>  <code class="language-verilog match-braces line-numbers">
  
class BaseClass;
	int data;
	
	function new();
		data = 32'hc0de_c0de;
	endfunction
endclass

module tb;
	BaseClass base;
	initial begin
		base = new();
		$display ("data=0x%0h", base.data);
	end
endmodule

  </code>
</pre>
</pre><h2>Abstract Class Example</h2><p>Let us declare the class <span class=signal>BaseClass</span> as <code>virtual</code> to make it an <i>abstract</i> class and see what happens.</p><pre>  <code class="language-verilog match-braces line-numbers">
  
virtual class BaseClass;
	int data;
	
	function new();
		data = 32'hc0de_c0de;
	endfunction
endclass

module tb;
	BaseClass base;
	initial begin
		base = new();
		$display ("data=0x%0h", base.data);
	end
endmodule

  </code>
</pre>
<p>A compilation error is reported by the simulator as shown below since abstract classes are not allowed to be instantiated.</p>
