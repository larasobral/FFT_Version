`include "invN.sv"

module divbyN  #(parameter N=16, parameter W=16, parameter BIT_FRAC=1
		)(input logic signed [W:0] x[2*N],
                 output logic signed [W:0] y[2*N]);
	  
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
				assign y[k] = x[k]>>>p;
				assign y[k + N] = x[k + N]>>>p;
			end
		end  
		else begin  
			for(k=0; k<N; k++)begin
				assign y[k] = round(x[k]*inv_N);
				assign y[k + N] = round(x[k + N]*inv_N);
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


  

