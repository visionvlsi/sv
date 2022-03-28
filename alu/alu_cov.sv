class alu_cov;
	mailbox #(alu_tx) mon2cov;
       	alu_tx tx;
  
   covergroup alu_cg;
	alu_a:coverpoint tx.a  {
	    bins a[10]={[0:50]};
	 }
        alu_b:coverpoint tx.b {
		bins b[10]={[0:50]};
	    }
        alu_sel:coverpoint tx.sel  {
              bins sel[]={[0:3]};
      }
     endgroup	
 
	 function new();
          alu_cg=new();
        this.mon2cov=alu_cfg::mon2cov;
   endfunction 

  task run ();
 forever begin 
    $display ("axi_cov::run");
    mon2cov.get(tx);
      alu_cg.sample();
      $display ("COVER--COVER--COVER--COVER");
  end   
  endtask 
  endclass 

