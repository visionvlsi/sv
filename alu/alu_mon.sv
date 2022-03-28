class alu_mon;
 mailbox # (alu_tx) mon2scb;
 mailbox # (alu_tx) mon2cov;
   virtual alu_intf vif;
   alu_tx tx;
 function new();
     this.mon2scb=alu_cfg::mon2scb;
     this.mon2cov=alu_cfg::mon2cov;
   endfunction 

  task run (); 
   forever  begin	  
     vif=alu_cfg::vif;
     wait (!vif.rst);
   $display ("axi_mon::run");
      tx=new();
    @(posedge vif.clk)
       tx.a= vif.a;
       tx.b=vif.b;
       tx.sel=vif.sel;
         @(negedge vif.clk);
	 @ (posedge vif.clk)
       tx.out=vif.out;
      mon2scb.put(tx);
       mon2cov.put(tx);
       end
  endtask 
  endclass 
