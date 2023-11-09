`timescale 1ns/1ps
parameter BIT_INT = 8;
parameter BIT_FRAC = 8;
parameter W = BIT_INT+BIT_FRAC;

`include "FFT.sv"

`define SAMPLES 4
parameter N = `SAMPLES;

module top();
	logic signed [W:0] x[N][1:0];
  	logic signed [W+N-1:0] X[N][1:0];
  // Set sel=0 to compute the forward FFT
  // Set sel=1 to compute the inverse FFT
	RecursiveFFT #(.N(N), .W(W), .sel(0)) RFFT(.x(x), .X(X));
  
	parameter signed [W:0] entreal[4] = {+1, 0, -1, 0}, entimg[4] = {0, -1, 0, 1};
	localparam F=1<<BIT_FRAC;

	logic [W-1:0] a,b,c, d;
	assign {c, d} = a*b;
	logic [W-1:0] A, B, C;
assign C =  A*B;
	initial begin
		A = -10;
		B = -15;
#1
		$display ("A = %b, \tB,= %b \tC = %d,\t%b", A, B, C, C);

		//a = 16'b1000_0000_0000_0000;
		a = -16'd32768;
		b = -16'd56;
		#4
		$display("a = %d%d, \t%b", 16'b0,a, a);
    		$display("b = %d%d, \t%b", 16'b0,b, b);
		$display("{c,d} = %d%d, \t%b%b", c, d, c, d);
		$display("c = %d, \t%b", c, c);
    		$display("d = %d, \t%b", d, d);
		$display("C = %d", c*(1<<16)+d);
    		for(int k=0; k<N; k++)begin
      			x[k][0]= entreal[k]<<<BIT_FRAC;
      			x[k][1]= entimg[k]<<<BIT_FRAC;
			//x[k][0]=k<<<BIT_FRAC;
      			//x[k][1]=(N-1-k)<<<BIT_FRAC;
			//$display("x[%0d]=%0f+i*(%0f)", 
	               // k, real'(x[k][0])/F,real'(x[k][1])/F);
		end
		#1
		testFFTinput(.x(x), .X(X));
		$finish;
	end
	task testFFTinput(input logic signed [W:0] x[N][1:0], 
                    	  input logic signed [W+N-1:0] X[N][1:0]);
		for(int k=0; k<N; k++)begin 
      			$display("x[%0d]=%0f+i*(%0f), X[%0d]=%f+i*(%f)", 
                		  k, real'(x[k][0])/F, real'(x[k][1])/F, 
                		  k, real'(X[k][0])/F, real'(X[k][1])/F);
		end
	endtask: testFFTinput

endmodule: top
