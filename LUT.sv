module LUT #(parameter W = 16, parameter N = 16)
    (
    input bit sine_or_cosine, // 0->seno, 1->cosseno
    input logic signed[W-1:0] angle,
    output logic signed[W+N-1:0] value
);

    always_comb begin
        case (angle)
            7'b0000000: begin
                if (sine_or_cosine == 0)
                    value = 16'b0000000000000000;
                else
                    value = 16'b0111111111111111;
            end
            7'b0000001: begin
                if (sine_or_cosine == 0)
                    value = 16'b0000010011101100;
                else
                    value = 16'b0111111111111111;
            end
            7'b0000010: begin
                if (sine_or_cosine == 0)
                    value = 16'b0000100111011000;
                else
                    value = 16'b0111111111111111;
            end
            7'b0000011: begin
                if (sine_or_cosine == 0)
                    value = 16'b0000111011001011;
                else
                    value = 16'b0111111111111110;
            end
            7'b0000100: begin
                if (sine_or_cosine == 0)
                    value = 16'b0001001011111011;
                else
                    value = 16'b0111111111111110;
            end
            7'b0000101: begin
                if (sine_or_cosine == 0)
                    value = 16'b0001011000111110;
                else
                    value = 16'b0111111111111101;
            end
            7'b0000110: begin
                if (sine_or_cosine == 0)
                    value = 16'b0001101001001101;
                else
                    value = 16'b0111111111111101;
            end
            7'b0000111: begin
                if (sine_or_cosine == 0)
                    value = 16'b0001111001000111;
                else
                    value = 16'b0111111111111100;
            end
            7'b0001000: begin
                if (sine_or_cosine == 0)
                    value = 16'b0010001001000011;
                else
                    value = 16'b0111111111111011;
            end
            7'b0001001: begin
                if (sine_or_cosine == 0)
                    value = 16'b0010011000100110;
                else
                    value = 16'b0111111111111011;
            end
            7'b0001010: begin
                if (sine_or_cosine == 0)
                    value = 16'b0010101000001000;
                else
                    value = 16'b0111111111111010;
            end
            7'b0001011: begin
                if (sine_or_cosine == 0)
                    value = 16'b0010110111010011;
                else
                    value = 16'b0111111111111001;
            end
            7'b0001100: begin
                if (sine_or_cosine == 0)
                    value = 16'b0011000110000101;
                else
                    value = 16'b0111111111111001;
            end
            7'b0001101: begin
                if (sine_or_cosine == 0)
                    value = 16'b0011010011001110;
                else
                    value = 16'b0111111111111000;
            end
            7'b0001110: begin
                if (sine_or_cosine == 0)
                    value = 16'b0011011111011010;
                else
                    value = 16'b0111111111110111;
            end
            7'b0001111: begin
                if (sine_or_cosine == 0)
                    value = 16'b0011101010001010;
                else
                    value = 16'b0111111111110110;
            end
            7'b0010000: begin
                if (sine_or_cosine == 0)
                    value = 16'b0011110100110110;
                else
                    value = 16'b0111111111110101;
            end
            7'b0010001: begin
                if (sine_or_cosine == 0)
                    value = 16'b0011111111001011;
                else
                    value = 16'b0111111111110100;
            end
            7'b0010010: begin
                if (sine_or_cosine == 0)
                    value = 16'b0100001000111011;
                else
                    value = 16'b0111111111110011;
            end
            7'b0010011: begin
                if (sine_or_cosine == 0)
                    value = 16'b0100010001111100;
                else
                    value = 16'b0111111111110010;
            end
            7'b0010100: begin
                if (sine_or_cosine == 0)
                    value = 16'b0100011011101000;
                else
                    value = 16'b0111111111110001;
            end
            7'b0010101: begin
                if (sine_or_cosine == 0)
                    value = 16'b0100100101101101;
                else
                    value = 16'b0111111111110001;
            end
            7'b0010110: begin
                if (sine_or_cosine == 0)
                    value = 16'b0100101111000110;
                else
                    value = 16'b0111111111110000;
            end
            7'b0010111: begin
                if (sine_or_cosine == 0)
                    value = 16'b0100111000100010;
                else
                    value = 16'b0111111111101111;
            end
            7'b0011000: begin
                if (sine_or_cosine == 0)
                    value = 16'b0101000001011111;
                else
                    value = 16'b0111111111101110;
            end
            7'b0011001: begin
                if (sine_or_cosine == 0)
                    value = 16'b0101001001001000;
                else
                    value = 16'b0111111111101101;
            end
            7'b0011010: begin
                if (sine_or_cosine == 0)
                    value = 16'b0101010000000010;
                else
                    value = 16'b0111111111101100;
            end
            7'b0011011: begin
                if (sine_or_cosine == 0)
                    value = 16'b0101010111100010;
                else
                    value = 16'b0111111111101011;
            end
            7'b0011100: begin
                if (sine_or_cosine == 0)
                    value = 16'b0101011110010001;
                else
                    value = 16'b0111111111101010;
            end
            7'b0011101: begin
                if (sine_or_cosine == 0)
                    value = 16'b0101100100011110;
                else
                    value = 16'b0111111111101000;
            end
            7'b0011110: begin
                if (sine_or_cosine == 0)
                    value = 16'b0101101001101011;
                else
                    value = 16'b0111111111100111;
            end
            7'b0011111: begin
                if (sine_or_cosine == 0)
                    value = 16'b0101101110010110;
                else
                    value = 16'b0111111111100110;
            end
            7'b0100000: begin
                if (sine_or_cosine == 0)
                    value = 16'b0101110010100010;
                else
                    value = 16'b0111111111100100;
            end
            7'b0100001: begin
                if (sine_or_cosine == 0)
                    value = 16'b0101110111110001;
                else
                    value = 16'b0111111111100011;
            end
            7'b0100010: begin
                if (sine_or_cosine == 0)
                    value = 16'b0101111100011101;
                else
                    value = 16'b0111111111100010;
            end
            7'b0100011: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110000000001000;
                else
                    value = 16'b0111111111100001;
            end
            7'b0100100: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110000010110010;
                else
                    value = 16'b0111111111100000;
            end
            7'b0100101: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110000101001010;
                else
                    value = 16'b0111111111011111;
            end
            7'b0100110: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110000111001100;
                else
                    value = 16'b0111111111011110;
            end
            7'b0100111: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001000110110;
                else
                    value = 16'b0111111111011101;
            end
            7'b0101000: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001010001100;
                else
                    value = 16'b0111111111011100;
            end
            7'b0101001: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001011001000;
                else
                    value = 16'b0111111111011010;
            end
            7'b0101010: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001011100010;
                else
                    value = 16'b0111111111011001;
            end
            7'b0101011: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001011111000;
                else
                    value = 16'b0111111111011000;
            end
            7'b0101100: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001100001100;
                else
                    value = 16'b0111111111010110;
            end
            7'b0101101: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001100011110;
                else
                    value = 16'b0111111111010101;
            end
            7'b0101110: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001100101100;
                else
                    value = 16'b0111111111010100;
            end
            7'b0101111: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001100110110;
                else
                    value = 16'b0111111111010011;
            end
            7'b0110000: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001100111111;
                else
                    value = 16'b0111111111010010;
            end
            7'b0110001: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101000110;
                else
                    value = 16'b0111111111010001;
            end
            7'b0110010: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101001101;
                else
                    value = 16'b0111111111010000;
            end
            7'b0110011: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101010001;
                else
                    value = 16'b0111111111001111;
            end
            7'b0110100: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101010101;
                else
                    value = 16'b0111111111001110;
            end
            7'b0110101: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101011000;
                else
                    value = 16'b0111111111001101;
            end
            7'b0110110: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101011010;
                else
                    value = 16'b0111111111001100;
            end
            7'b0110111: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101011100;
                else
                    value = 16'b0111111111001011;
            end
            7'b0111000: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101011110;
                else
                    value = 16'b0111111111001010;
            end
            7'b0111001: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101011111;
                else
                    value = 16'b0111111111001001;
            end
            7'b0111010: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101100000;
                else
                    value = 16'b0111111111001000;
            end
            7'b0111011: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101100001;
                else
                    value = 16'b0111111111000111;
            end
            7'b0111100: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101100010;
                else
                    value = 16'b0111111111000110;
            end
            7'b0111101: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101100011;
                else
                    value = 16'b0111111111000101;
            end
            7'b0111110: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101100100;
                else
                    value = 16'b0111111111000100;
            end
            7'b0111111: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101100101;
                else
                    value = 16'b0111111111000011;
            end
            7'b1000000: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101100110;
                else
                    value = 16'b0111111111000010;
            end
            7'b1000001: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101100111;
                else
                    value = 16'b0111111111000001;
            end
            7'b1000010: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101101000;
                else
                    value = 16'b0111111111000000;
            end
            7'b1000011: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101101001;
                else
                    value = 16'b0111111110111111;
            end
            7'b1000100: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101101010;
                else
                    value = 16'b0111111110111110;
            end
            7'b1000101: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101101011;
                else
                    value = 16'b0111111110111101;
            end
            7'b1000110: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101101100;
                else
                    value = 16'b0111111110111100;
            end
            7'b1000111: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101101101;
                else
                    value = 16'b0111111110111011;
            end
            7'b1001000: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101101110;
                else
                    value = 16'b0111111110111010;
            end
            7'b1001001: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101101111;
                else
                    value = 16'b0111111110111001;
            end
            7'b1001010: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101110000;
                else
                    value = 16'b0111111110111000;
            end
            7'b1001011: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101110001;
                else
                    value = 16'b0111111110110111;
            end
            7'b1001100: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101110010;
                else
                    value = 16'b0111111110110110;
            end
            7'b1001101: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101110011;
                else
                    value = 16'b0111111110110101;
            end
            7'b1001110: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101110100;
                else
                    value = 16'b0111111110110100;
            end
            7'b1001111: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101110101;
                else
                    value = 16'b0111111110110011;
            end
            7'b1010000: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101110110;
                else
                    value = 16'b0111111110110010;
            end
            7'b1010001: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101110111;
                else
                    value = 16'b0111111110110001;
            end
            7'b1010010: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101111000;
                else
                    value = 16'b0111111110110000;
            end
            7'b1010011: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101111001;
                else
                    value = 16'b0111111110101111;
            end
            7'b1010100: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101111010;
                else
                    value = 16'b0111111110101110;
            end
            7'b1010101: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101111011;
                else
                    value = 16'b0111111110101101;
            end
            7'b1010110: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101111100;
                else
                    value = 16'b0111111110101100;
            end
            7'b1010111: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101111101;
                else
                    value = 16'b0111111110101011;
            end
            7'b1011000: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101111110;
                else
                    value = 16'b0111111110101010;
            end
            7'b1011001: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001101111111;
                else
                    value = 16'b0111111110101001;
            end
            7'b1011010: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001110000000;
                else
                    value = 16'b0111111110101000;
            end
            7'b1011011: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001110000001;
                else
                    value = 16'b0111111110100111;
            end
            7'b1011100: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001110000010;
                else
                    value = 16'b0111111110100110;
            end
            7'b1011101: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001110000011;
                else
                    value = 16'b0111111110100101;
            end
            7'b1011110: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001110000100;
                else
                    value = 16'b0111111110100100;
            end
            7'b1011111: begin
                if (sine_or_cosine == 0)
                    value = 16'b0110001110000101;
                else
                    value = 16'b0111111110100011;
            end
            default: begin
                if (sine_or_cosine == 0)
                    value = 16'b0000000000000000;
                else
                    value = 16'b0111111111111111;
            end
        endcase
    end

endmodule
