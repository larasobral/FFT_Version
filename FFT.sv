`include "butterfly.sv"
`include "computeMatrix.sv"
`include "swap.sv"
`include "divbyN.sv"
`include "rom.sv"

module FFT #(parameter N = 16, parameter W=16)
            (input logic signed [W:0] x[2*N],
             output logic signed [W+N-1:0] X[2*N]);
      
	logic signed [W-1:0] xe[N], xo[N];
	logic signed [W+N/2-1:0] Xe[N], Xo[N];

	genvar k;
	generate
		for(k=0; k<N; k++)begin
			assign xe[k] = x[2*k];
			assign xo[k] = x[2*k+1];
		end

		if(N[0]) begin
			butterfly #(.N(N), .W(W)) m_butterfly(.Xe(Xe), .Xo(Xo), .X(X));
			FFT #(.N(N/2), .W(W)) FFT_e(.x(xe), .X(Xe));
			FFT #(.N(N/2), .W(W)) FFT_o(.x(xo), .X(Xo));
		end
		else computeMatrix #(.N(N), .W(W)) Matrix(.x(x), .X(X));
	endgenerate 
	  
endmodule: FFT

module iFFT #(parameter N = 16, parameter W = 16)
            (input logic signed [W:0] x[2*N],
             output logic signed [W+N-1:0] X[2*N]);
  
  logic signed [W:0] x_in[2*N];
  logic signed [W+N-1:0] Xa[2*N];
  logic signed [W+N-1:0] Xb[2*N];
  
  swap #(.N(N), .W(W)) swap_in(.x(x), .y(x_in));
  FFT #(.N(N), .W(W)) mFFT(.x(x_in), .X(Xa));
  swap #(.N(N), .W(W+N-1)) swap_out(.x(Xa), .y(Xb));
  divbyN #(.N(N), .W(W+N-1)) divN(.x(Xb), .y(X));
  
endmodule: iFFT

module RecursiveFFT #(parameter N = 16, 
                      parameter W = 16,
                      parameter sel = 1)
                     (input logic signed [W:0] x[2*N],
                      output logic signed [W+N-1:0] X[2*N]);

  if(!sel)
    FFT #(.N(N), .W(W)) mFFT(.x(x), .X(X));
  else
    iFFT #(.N(N), .W(W)) miFFT(.x(x), .X(X));
 
endmodule: RecursiveFFT
