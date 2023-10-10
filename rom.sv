module SinCosROM #(parameter W = 16)(
    input logic [6:0] angle, // Entrada de ângulo de 0 a 90 graus (0 a 90 em ponto fixo)
    output logic [W-1:0] sin, // Saída do seno
    output logic [W-1:0] cos // Saída do cosseno
);

    // Tamanho da ROM baseado na quantidade de entradas possíveis (0 a 90 graus)
    localparam ROM_DEPTH = 91;
    // Largura dos dados na ROM
    localparam ROM_WIDTH = W;

    // Valores do seno e cosseno em ponto fixo com 16 bits
    logic [ROM_WIDTH-1:0] sin_rom [0:ROM_DEPTH-1] = {
       	16'b0000000000000000,
	16'b0000001001011100,
	16'b0000010011111011,
	16'b0000011101001001,
	16'b0000100101111011,
	16'b0000101100001110,
	16'b0000110010010010,
	16'b0000111000010011,
	16'b0001000000000000,
	16'b0001000111011011,
	16'b0001001101100011,
	16'b0001010011010011,
	16'b0001011001001010,
	16'b0001100000101001,
	16'b0001100110001110,
	16'b0001101011011011,
	16'b0001110000011000,
	16'b0001110101001000,
	16'b0001111001101000,
	16'b0001111101111000,
	16'b0010000000000000,
	16'b0010000101111000,
	16'b0010001001101000,
	16'b0010001101001000,
	16'b0010010000011000,
	16'b0010010011011000,
	16'b0010010110001110,
	16'b0010011000111000,
	16'b0010011011011000,
	16'b0010011101101000,
	16'b0010011111101000,
	16'b0010100001111000,
	16'b0010100011111000,
	16'b0010100101101000,
	16'b0010100111001000,
	16'b0010101000011000,
	16'b0010101001011000,
	16'b0010101010011000,
	16'b0010101011011000,
	16'b0010101100011000,
	16'b0010101101011000,
	16'b0010101110001110,
	16'b0010101110111000,
	16'b0010101111011000,
	16'b0010101111101000,
	16'b0010101111111000,
	16'b0010110000001000,
	16'b0010110000011000,
	16'b0010110000101000,
	16'b0010110000111000,
	16'b0010110001001000,
	16'b0010110001011000,
	16'b0010110001101000,
	16'b0010110001111000,
	16'b0010110010001000,
	16'b0010110010011000,
	16'b0010110010101000,	
	16'b0010110010111000,
	16'b0010110011001000,
	16'b0010110011011000,
	16'b0010110011101000,
	16'b0010110011111000,
	16'b0010110100001000,
	16'b0010110100011000,
	16'b0010110100101000,	
	16'b0010110100111000,
	16'b0010110101001000,
	16'b0010110101011000,
	16'b0010110101101000,
	16'b0010110101111000,
	16'b0010110110001110,
	16'b0010110110011000,
	16'b0010110110101000,
	16'b0010110110111000,
	16'b0010110111001000,
	16'b0010110111011000,
	16'b0010110111101000,
	16'b0010110111111000,
	16'b0010111000001000,
	16'b0010111000011000,
	16'b0010111000101000,	
	16'b0010111000111000,
	16'b0010111001001000,
	16'b0010111001011000,
	16'b0010111001101000,
	16'b0010111001111000,
	16'b0010111010001000,
	16'b0010111010011000,
	16'b0010111010101000,
	16'b0010111010111000,
	16'b0010111011001000
    };
    logic [ROM_WIDTH-1:0] cos_rom [0:ROM_DEPTH-1] = {
        16'b1111111111111111,
	16'b1111111111111111,
	16'b1111111111111111,
	16'b1111111111111110,
	16'b1111111111111110,
	16'b1111111111111101,
	16'b1111111111111101,
	16'b1111111111111100,
	16'b1111111111111100,
	16'b1111111111111011,
	16'b1111111111111010,
	16'b1111111111111010,
	16'b1111111111111001,	
	16'b1111111111111000,
	16'b1111111111110111,
	16'b1111111111110111,
	16'b1111111111110110,
	16'b1111111111110101,
	16'b1111111111110100,
	16'b1111111111110011,
	16'b1111111111110010,
	16'b1111111111110001,
	16'b1111111111110000,
	16'b1111111111101111,
	16'b1111111111101110,
	16'b1111111111101101,
	16'b1111111111101100,
	16'b1111111111101011,
	16'b1111111111101010,
	16'b1111111111101001,
	16'b1111111111101000,
	16'b1111111111100111,
	16'b1111111111100110,
	16'b1111111111100101,
	16'b1111111111100100,
	16'b1111111111100010,
	16'b1111111111100001,
	16'b1111111111100000,
	16'b1111111111011111,
	16'b1111111111011110,
	16'b1111111111011101,
	16'b1111111111011100,
	16'b1111111111011011,
	16'b1111111111011010,
	16'b1111111111011000,
	16'b1111111111010111,
	16'b1111111111010110,
	16'b1111111111010101,
	16'b1111111111010100,
	16'b1111111111010011,
	16'b1111111111010010,
	16'b1111111111010000,
	16'b1111111111001111,
	16'b1111111111001110,
	16'b1111111111001101,
	16'b1111111111001100,
	16'b1111111111001011,
	16'b1111111111001010,
	16'b1111111111001001,
	16'b1111111111001000,
	16'b1111111111000111,
	16'b1111111111000110,
	16'b1111111111000101,
	16'b1111111111000100,
	16'b1111111111000010,
	16'b1111111111000001,
	16'b1111111111000000,	
	16'b1111111110111111,
	16'b1111111110111110,
	16'b1111111110111101,
	16'b1111111110111100,
	16'b1111111110111011,
	16'b1111111110111010,
	16'b1111111110111001,
	16'b1111111110111000,
	16'b1111111110110110,
	16'b1111111110110101,
	16'b1111111110110100,
	16'b1111111110110011,
	16'b1111111110110010,
	16'b1111111110110001,
	16'b1111111110110000,
	16'b1111111110101111,
	16'b1111111110101110,
	16'b1111111110101100,
	16'b1111111110101011,
	16'b1111111110101010,
	16'b1111111110101001,
	16'b1111111110101000,
	16'b1111111110100110,
	16'b1111111110100101
    };

    // Saídas baseadas no ângulo de entrada
    assign sin = sin_rom[angle];
    assign cos = cos_rom[angle];

endmodule



