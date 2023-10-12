`timescale 1ns/1ps
parameter BIT_INT = 8;
parameter BIT_FRAC = 8;
parameter W = BIT_INT+BIT_FRAC;

`include "FFT.sv"

`define SAMPLES 16
parameter N = `SAMPLES;

module top();
	logic signed [W:0] x[2*N];
	logic signed [W+N-1:0] X[2*N];
  
  // Set sel=0 to compute the forward FFT
  // Set sel=1 to compute the inverse FFT
	RecursiveFFT #(.N(N), .W(W), .sel(0)) RFFT(.x(x), .X(X));
  

	localparam F=1<<BIT_FRAC;

	initial begin
    		for(int k=0; k<N; k++)begin
      			x[k]=k<<<BIT_FRAC;
      			x[k + N]=(N-1-k)<<<BIT_FRAC;

		end
		#1
		testFFTinput(.x(x), .X(X));
		$finish;
	end
	task testFFTinput(input logic signed [W:0] x[2*N], 
                    	  input logic signed [W+N-1:0] X[2*N]);
		for(int k=0; k<N; k++)begin 
      			$display("x[%0d]=%0f+i*(%0f), X[%0d]=%f+i*(%f)", 
			k, real'(x[k])/F, real'(x[k + N])/F,
			k, real'(X[k])/F, real'(X[k + N])/F);
		end
	endtask: testFFTinput

endmodule: top
