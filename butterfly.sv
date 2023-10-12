`include "rom.sv"

module butterfly #(
    parameter N = 16,
    parameter W = 16
)(
    input logic signed [W+N/2-1:0] Xe[N],
    input logic signed [W+N/2-1:0] Xo[N],
    output logic signed [W+N-1:0] X[2*N]
);

    logic signed [W+N/2:0] G[2*N];
    logic [W-1:0] sin[N];
    logic [W-1:0] cos[N];
    logic [6:0] k;
    //logic signed [W + N / 2:0] sin[N][1:0];
  //  localparam theta = -2 * $acos(-1)/N;
     	
    rom #(.W(W), .N(N))ROM_instance(
    .address(k), // Entrada de ângulo de 0 a 90 graus (0 a 90 em ponto fixo)
    .sin(sin), // Saída do seno
    .cos(cos)); // Saída do cosseno

    generate
        for (genvar k = 0; k < N/2; k++) begin
		//assign address = k;
		 // Atribuição dos valores
            	assign G[k] = ((cos[k])*(Xo[k]))-((sin[k])*(Xo[k+N]));
        	assign G[k+N] = ((cos[k])*(Xo[k+N]))+((sin[k])*(Xo[k]));

          	// Butterfly computation
     	       assign X[k] = Xe[k] + G[k];
   	       assign X[k+N] = Xe[k+N/2] + G[k+N/2];

               assign X[k + N/2] = Xe[k]- G[k];
               assign X[k + N + N/2] = Xe[k+N/2] - G[k+N/2];

                
        end
    endgenerate

endmodule: butterfly 



