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

On EDAPlay ground https://www.edaplayground.com/x/Di_n

</pre><h2>Extending Abstract Classes</h2><p>Abstract classes can be extended just like any other SystemVerilog class using the <code>extends</code> keyword like shown below.</p><pre>  <code class="language-verilog match-braces line-numbers">
  
virtual class BaseClass;
	int data;
	
	function new();
		data = 32'hc0de_c0de;
	endfunction
endclass

class ChildClass extends BaseClass;
	function new();
		data = 32'hfade_fade;
	endfunction
endclass

module tb;
	ChildClass child;
	initial begin
		child = new();
		$display ("data=0x%0h", child.data);
	end
endmodule

  </code>
</pre>
<p>It can be seen from the simulation output below that it is perfectly valid to extend abstract classes to form other classes that can be instantiated using <code>new()</code> method.</p>

<h2>Pure Virtual Methods</h2><p>A <code>virtual</code> method inside an abstract class can be declared with the keyword <code>pure</code> and is called a <i>pure virtual</i> method. Such methods only require a prototype to be specified within the abstract class and the implementation is left to defined within the sub-classes.</p><h2>Pure Method Example</h2><pre>  <code class="language-verilog match-braces line-numbers">
  
virtual class BaseClass;
	int data;
	
	pure virtual function int getData();
endclass

class ChildClass extends BaseClass;
	virtual function int getData();
		data = 32'hcafe_cafe;
		return data;
	endfunction
endclass

module tb;
	ChildClass child;
	initial begin
		child = new();
		$display ("data = 0x%0h", child.getData());
	end
endmodule

  </code>
</pre>
<p class="alert alert-warning">The pure virtual method prototype and its implementation should have the same arguments and return type.</p>
