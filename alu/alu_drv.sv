class alu_drv;
  mailbox # (alu_tx) gen2drv;
   virtual alu_intf vif;
   alu_tx tx;
    
     function new();
	     this.gen2drv=alu_cfg::gen2drv;
	     this.vif=alu_cfg::vif;
	   endfunction 

	   task run ();
	    forever  begin 
             wait (!vif.rst);
	   gen2drv.get(tx);
	   $display ("alu_drv::run");
	   @(posedge vif.clk)
	   vif.a=tx.a;
	   vif.b=tx.b;
	   vif.sel=tx.sel;
	    //tx.print(); 
	    //$display ("----------------------");
           end 
           endtask 
    endclass 


