module swap #(parameter N=16, parameter W=16)
             (input logic signed [W:0] x[2*N],
              output logic signed [W:0] y[2*N]);

	genvar k;
	generate 
		for(k=0; k<N; k++)begin
			assign y[k] = x[k+N];
			assign y[k+N] = x[k];
		end
	endgenerate

endmodule: swap
