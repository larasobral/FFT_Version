module invN #(parameter N=16, parameter W=16, parameter BIT_FRAC=1)           
             (output logic signed [W:0] y);
  
  logic [W:0] A;
  logic [W:0] T;
  always_comb begin
    A = 0;
    T=1<<BIT_FRAC;
    for(int k=BIT_FRAC; k>=0; k--) begin
      if(N<<k <= T)begin
        A = A+(1<<k);
        T = T-(N<<k);
      end
    y = A;    
    end
  end
  
endmodule: invN
