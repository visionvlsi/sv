typedef class alu_cfg;
class alu_gen;
  mailbox #(alu_tx) gen2drv;
  alu_tx tx;
  logic clk;
  function new();
      this.gen2drv=alu_cfg::gen2drv;
     endfunction 

     task run();
     // begin
      //tx=new();
     for (int i=0;i<=15;i++)
         begin 	     
	tx=new();
	// tx.randomize();
        assert (tx.randomize());
        gen2drv.put(tx);
       @(posedge clk)
        $display ("alu_gen::run");
	 tx.print();
	 $display ("//////////////////////");
        $display ("Paket Number -----%0d",i);
         end 	
    // end 
     endtask 
endclass 
