class ex;
  rand bit [2:0] ssn[9];
  
  constraint No_Consecutive_Repetitions{
   foreach(ssn[i]){
     if(i>1){
       !(ssn[i] == ssn[i-1] && ssn[i] == ssn[i-2]);  // Ensure that ssn[i] is not equal to the previous two values (no three consecutive repetitions)
   }}}
   
   constraint No_Three_Numbers_Consecutive{
     foreach(ssn[i]){
       if(i>1){ 
         !(ssn[i] == (ssn[i-1] + 1) && ssn[i-1] == (ssn[i-2] + 1)); // Prevent three consecutive increasing numbers (e.g., 1, 2, 3)
       }
     }
   }
   constraint No_Zero_Start{
     ssn[0] != 0; // Ensure that the first number in the SSN is not 0
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
