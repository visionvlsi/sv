class alu_tx;
  rand bit [7:0] a;
  rand bit [7:0] b;
  rand bit [1:0] sel;
       bit [7:0] out;

  function print ();
	 begin 
	  $display ("alu_tx::display");
          $display ("a=%0d   b=%0d  sel=%0d",a,b,sel);
  end 
  endfunction 

  constraint a_notequal_b {a>0;b>0;a!=b;a>b;};
  constraint a_and_b_small {a<20;b<15;};
  //constraint sel_fix {sel==2'b01;};

  endclass 

