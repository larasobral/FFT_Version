`timescale 1ns/1ps
parameter BIT_INT = 8;
parameter BIT_FRAC = 8;
parameter W = BIT_INT+BIT_FRAC;

`include "FFT.sv"

`define SAMPLES 16
parameter N = `SAMPLES;

module top();
	logic signed [W-1:0] x[N][1:0];
	logic signed [W+N-1:0] X[N][1:0];
  
  // Set sel=0 to compute the forward FFT
  // Set sel=1 to compute the inverse FFT
	RecursiveFFT #(.N(N), .W(W), .sel(0)) RFFT(.x(x), .X(X));
  
	parameter signed [W:0] entreal[4] = {+1, 0, -1, 0}, entimg[4] = {0, -1, 0, 1};
	localparam F=1<<BIT_FRAC;

	initial begin
    		for(int k=0; k<N; k++)begin
      			x[k][0]=entreal[k]<<<BIT_FRAC;
      			x[k][1]=entimg[k]<<<BIT_FRAC;
			/*x[k][0]=k<<<BIT_FRAC;
      			x[k][1]=(N-1-k)<<<BIT_FRAC;*/
			$display("x[%0d]=%0f+i*(%0f)", 
	                k, real'(x[k][0])/F,real'(x[k][1])/F);
		end
		#1
		testFFTinput(.x(x), .X(X));
		$finish;
	end
	task testFFTinput(input logic signed [W-1:0] x[N][1:0], 
                    	  input logic signed [W+N-1:0] X[N][1:0]);
		for(int k=0; k<N; k++)begin 
      			$display("x[%0d]=%0f+i*(%0f), X[%0d]=%f+i*(%f)", 
			k, real'(x[k][0])/F, real'(x[k][1])/F,
			k, real'(X[k][0])/F, real'(X[k][1])/F);
		end
	endtask: testFFTinput

endmodule: top
