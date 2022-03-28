class alu_scb;
   mailbox # (alu_tx) mon2scb;
   alu_tx tx;

 function new();
     this.mon2scb=alu_cfg::mon2scb;
   endfunction 

  task run (); 
    forever  begin 
            begin 
     $display ("axi_scb::run");
      mon2scb.get(tx);
    $display ("tx.a=%0d,tx.b=%0d,tx.out=%0d,tx.sel=%0d",tx.a,tx.b,tx.out,tx.sel); 
        case (tx.sel)
      2'b00:      
             begin 
             if (tx.a+tx.b==tx.out)
		   $display ("Addition test Passed");
	       else 
		   $display ("Addition Test Failed");
             end 
      2'b01:      
             begin 
             if (tx.a-tx.b==tx.out)
		   $display ("Subtraction test Passed");
	       else 
		   $display ("Subtraction Test Failed");
             end 
  2'b10:      
             begin 
             if (tx.a*tx.b==tx.out)
		   $display ("Multiplication test Passed");
	       else 
		   $display ("Multiplication Test Failed");
             end 
  2'b11:      
             begin 
             if (tx.a/tx.b==tx.out)
		   $display ("Division test Passed");
	       else 
		   $display ("Division Test Failed");
             end 
       default:
	        $display ("I am in default");
    endcase 
      end  
     end 
  endtask 
  endclass 
   
	

