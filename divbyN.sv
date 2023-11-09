//parameter BIT_INT = 16;
//parameter BIT_FRAC = 16;
//parameter W = BIT_INT+BIT_FRAC;
`include "invN.sv"

module divbyN  #(parameter N=16, parameter W=16, parameter BIT_FRAC=1
		)(input logic signed [W:0] x[N][1:0],
                 output logic signed [W:0] y[N][1:0]);
	  
	logic signed [W:0] inv_N;
	invN #(.N(N), .W(W), .BIT_FRAC(BIT_FRAC)) m_invN (
  	.y(inv_N)
	);

	//logic [15:0]p;
	
	localparam p = $clog2(N);
	  
	localparam c = isPowerOfTwo(N);
	genvar k;
	  
	generate 
		if(c) begin
			for(k=0; k<N; k++)begin
				assign y[k][0] = x[k][0]>>>p;
				assign y[k][1] = x[k][1]>>>p;
			end
		end  
		else begin  
			for(k=0; k<N; k++)begin
				assign y[k][0] = round(x[k][0]*inv_N);
				assign y[k][1] = round(x[k][1]*inv_N);
			end
		end 
	endgenerate

	function logic signed [W:0] round(logic signed [W:0] x);
		return (x+(1<<<(BIT_FRAC-1)))>>>BIT_FRAC;
	endfunction: round
	  
	function logic isPowerOfTwo (input integer N);
		return (N != 0) && ((N & (N - 1)) == 0);
	endfunction: isPowerOfTwo
  
endmodule: divbyN

  
