module swap #(parameter N=4, parameter W=4)
             (input logic signed [W:0] x[N][1:0],
              output logic signed [W:0] y[N][1:0]);

	genvar k;
	generate 
		for(k=0; k<N; k++)begin
			assign y[k][0] = x[k][1];
			assign y[k][1] = x[k][0];
		end
	endgenerate

endmodule: swap
