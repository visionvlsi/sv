#  SystemVerilog Abstract Class 

SystemVerilog prohibits a class declared as virtual  to be directly instantiated and is called an abstract  class. <br/>
# Syntax
<pre><code>
virtual class <class-name>
	// class definition
endclass

</code></pre>
  
  <p>However, this class can be extended to form other sub-classes which can then be instantiated. This is useful to enforce testcase developers to always extend a base class to form another class for their needs. So <i>base</i> classes are usually declared as<code>virtual</code> although it is not mandatory.</p>
