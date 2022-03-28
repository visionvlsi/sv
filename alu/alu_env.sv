class alu_env;
   alu_gen gen;
   alu_drv drv;
   alu_mon mon;
   alu_scb scb;
   alu_cov cov;
   
   function new ();
   begin 
   gen=new();
   drv=new();
   mon=new();
   scb=new ();
   cov=new();
   end    
   endfunction 

   task run();
      begin 
        fork
         gen.run();
	 drv.run();
	 mon.run();
	 scb.run();
	 cov.run();
     join    
       end 
  endtask
  endclass 
