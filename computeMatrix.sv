 `include "memory_ed2.sv"

module computeMatrix #(
    parameter N = 16,
    parameter W = 16)

(   input logic signed [W:0] x[N][1:0],
    output logic signed [W+N-1:0] X[N][1:0]);

    logic signed[7:0] sin [16:0];
    logic signed[7:0] cos [16:0];

	memory_ed2 #(16, 16)dut(
	.sin_rom(sin),
	.cos_rom(cos));

	always_comb begin

		for(int k=0; k<N; k++)begin
     			X[k][1:0] = {0,0};
      			for(int j=0; j<N; j++)begin
			//	logic [W-N-1:0] aux[4];

				assign y = (cos[k*j][16]==x[j][0])? 
				
				  X[k][0] = X[k][0]+((cos[k*j][15:0])*(x[j][0]))-((sin[k*j][15:0])*(x[j][1]));
				  X[k][1] = X[k][1]+((cos[k*j][15:0])*(x[j][1]))+((sin[k*j][15:0])*(x[j][0]));
				
        		end
		end
 	end

    initial begin
	#10
	for (int k = 0; k < N; k++) begin
		$display("\n\n\n\nX[%d][0]:", k);
		for(int j =0; j<N; j++) begin
			$display("y = %b", cos[k*j][16]);
			$display("cos = ", cos[k*j][16]);
		end
    		$display("X[%d][0] =%0b", k, X[k][0],);
	end
	$finish;
    end 
endmodule:computeMatrix 


    // Computation of the Fourier matrix
	/*generate
    		for(genvar k=0; k<N; k++)begin
     			//assign X[k][1:0] = {0,0};
      			for(genvar j=0; j<N; j++)begin
				assign X[k][0] = X[k][0]+((cos[k*j])*(x[j][0]))-((sin[k*j])*(x[j][1]));
				assign X[k][1] = X[k][0]+((cos[k*j])*(x[j][1]))+((sin[k*j])*(x[j][0]));
        		end
		end
	endgenerate

*/
