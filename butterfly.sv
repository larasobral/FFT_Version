 `include "memory_ed2.sv"

module butterfly #(
    parameter N = 16,
    parameter W = 16
)(  
    input logic signed [W+N/2-1:0] Xe[N/2][1:0], 
    input logic signed [W+N/2-1:0] Xo[N/2][1:0],
    output logic signed [W+N-1:0] X[N][1:0]);

    logic signed [W+N/2:0] G[N][1:0];
    logic signed [7:0] sin [16:0];
    logic signed [7:0] cos [16:0];
//    logic [8:0] multiplication;
    //logic signed [W + N / 2:0] sin[N][1:0];
  //  localparam theta = -2 * $acos(-1)/N;
	memory_ed2 #(16, 16)dut(
	.sin_rom(sin),
	.cos_rom(cos));
   
    generate
        for (genvar k = 0; k < N/2; k++) begin
		assign multiplication = k;
		 // Atribuição dos valores
            	assign G[k][0] = ((cos[k])*(Xo[k][0]))-((sin[k])*(Xo[k][1]));
         	assign G[k][1] = ((cos[k])*(Xo[k][1]))+((sin[k])*(Xo[k][0]));

     		 // Butterfly computation
      		assign X[k][0] = Xe[k][0]+G[k][0];
      		assign X[k][1] = Xe[k][1]+G[k][1];
      
      		assign X[k+N/2][0] = Xe[k][0]-G[k][0];
      		assign X[k+N/2][1] = Xe[k][1]-G[k][1];
                
        end
    endgenerate
    initial begin
	#10
	for (int k = 0; k < N; k++) begin
    		$display("cos[%d] =%0b", k, cos[k]);
	end
	$finish;
    end 

endmodule: butterfly 

