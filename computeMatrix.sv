`include "rom.sv"

module computeMatrix #(
    parameter N = 16,
    parameter W = 16 
)(
    input logic signed [W:0] x[2*N],
    output logic signed [W + N - 1:0] X[2*N]
);

    logic [W-1:0] sin[N];
    logic [W-1:0] cos[N];
    logic [6:0] address;


    rom #(.W(W), .N(N))ROM_instance(
    .address(address), // Entrada de ângulo de 0 a 90 graus (0 a 90 em ponto fixo)
    .sin(sin), // Saída do seno
    .cos(cos)); // Saída do cosseno


   // Inicialização dos valores de sin e cos (um único cálculo no início)

    // Computation of the Fourier matrix
	generate
		for (genvar k = 0; k < N; k++) begin
	    		assign X[0] = 0;
			assign X[N] = 0;
		//n address = k;  
			if (k<2*N)begin 
				assign X[k] = X[0] + (cos[k]*x[k]) - (sin[k]*x[N+k]);
			end
			else begin 
				assign X[N+k] = X[N] + (cos[k]*x[N+k]) + (sin[k]*x[k]);
			end
        	end
	endgenerate

endmodule: computeMatrix 
