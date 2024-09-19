class ex;
  rand bit [2:0] ssn[9];
  
  constraint No_Consecutive_Repetitions{
   foreach(ssn[i]){
     if(i>1){
       !(ssn[i] == ssn[i-1] && ssn[i] == ssn[i-2]);
   }}}
   
   constraint No_Three_Numbers_Consecutive{
     foreach(ssn[i]){
       if(i>1){ 
         !(ssn[i] == (ssn[i-1] + 1) && ssn[i-1] == (ssn[i-2] + 1));
       }
     }
   }
   constraint No_Zero_Start{
       ssn[0] != 0;
     }

   
      
 function void display();
        $write("SSN number : SS#");
        foreach (ssn[i]) begin
            $write("%0d", ssn[i]);
        end
        $display("");
    endfunction
endclass
     
module tb;
 initial begin
        ex e = new();
        repeat(10) begin
            e.randomize();
            e.display();
        end
    end
endmodule
