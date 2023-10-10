`include "LUT.sv"

module computeMatrix #(
    parameter N = 16,
    parameter W = 16 
)(
    input logic signed [W-1:0] x[N][1:0],
    output logic signed [W + N - 1:0] X[N][1:0]
);
    //genvar k, j;
    
    //int k, j; 
	
    localparam theta = -2 * $acos(-1) / N;
    
    logic signed [W - 1:0] angle_values[N][N];
    logic signed [W + N - 1:0] cos_values[N][N];
    logic signed [W + N - 1:0] sin_values[N][N];

    // Computation of the Fourier matrix
    generate
        for (genvar k = 0; k < N; k++) begin
            for (genvar j = 0; j < N; j++) begin
                LUT #(W, N) lut_cos (
                    .sine_or_cosine(1'b1), 
                    .angle(angle_values[k][j]), 
                    .value(cos_values[k][j])
                );

                LUT #(W, N) lut_sin (
                    .sine_or_cosine(1'b0), 
                    .angle(angle_values[k][j]), 
                    .value(sin_values[k][j])
                );
            end
        end
    endgenerate
	always_comb begin
		for (int k = 0; k < N; k++) begin
	    		X[k][1:0] = {0,0};
            		for (int j = 0; j < N; j++) begin
				X[k][0] = X[k][0]+(cos_values[k][j]*x[j][0])-(sin_values[k][j]*x[j][1]);
        			X[k][1] = X[k][1]+(cos_values[k][j]*x[j][1])+(sin_values[k][j]*x[j][0]);

            		end
        	end
	end
endmodule: computeMatrix 


