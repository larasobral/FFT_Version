`include "LUT.sv"

module butterfly #(
    parameter N = 16,
    parameter W = 16
)(
    input logic signed [W + N/2 - 1:0] Xe[N / 2][1:0],
    input logic signed [W + N/2 - 1:0] Xo[N / 2][1:0],
    output logic signed [W + N - 1:0] X[N][1:0]
);

    logic signed [W + N / 2:0] G[N][1:0];
    logic signed [W + N / 2:0] value[N][1:0];
    localparam theta = -2 * $acos(-1)/N;
    logic k;

		LUT #(.W(W), .N(N)) lut_sin (
                    .sine_or_cosine(0), 
                    .angle(theta*k), 
                    .value(value[k][0]) // Saída da LUT para o seno
                );
		
                LUT #(.W(W), .N(N)) lut_cos (
                    .sine_or_cosine(1), 
                    .angle(theta*k), 
                    .value(value[k][1]) // Saída da LUT para o cosseno
                );
    
    generate
        for (genvar k = 0; k < (N/2); k++) begin
				
		 // Atribuição dos valores
            	assign G[k][0] = ((value[k][1])*(Xo[k][0]))-((value[k][0])*(Xo[k][1]));
        	assign G[k][1] = ((value[k][1])*(Xo[k][1]))+((value[k][0])*(Xo[k][0]));

            // Butterfly computation
     	       assign X[k][0] = Xe[k][0] + G[k][0];
   	       assign X[k][1] = Xe[k][1] + G[k][1];

               assign X[k + N/2][0] = Xe[k][0] - G[k][0];
               assign X[k + N/2][1] = Xe[k][1] - G[k][1];

                
        end
    endgenerate

endmodule: butterfly 


