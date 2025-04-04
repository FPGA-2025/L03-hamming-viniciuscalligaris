module calcula_hamming (
  input [10:0] entrada,
  output [14:0] saida
);
  wire p1, p2, p4, p8;

  wire d1 = entrada[0];
  wire d2 = entrada[1];
  wire d3 = entrada[2];
  wire d4 = entrada[3];
  wire d5 = entrada[4];
  wire d6 = entrada[5];
  wire d7 = entrada[6];
  wire d8 = entrada[7];
  wire d9 = entrada[8];
  wire d10 = entrada[9];
  wire d11 = entrada[10];

  // Cálculo dos bits de paridade par
  assign p1 = d1 ^ d2 ^ d4 ^ d5 ^ d7 ^ d9 ^ d11;
  assign p2 = d1 ^ d3 ^ d4 ^ d6 ^ d7 ^ d10 ^ d11;
  assign p4 = d2 ^ d3 ^ d4 ^ d8 ^ d9 ^ d10 ^ d11;
  assign p8 = d5 ^ d6 ^ d7 ^ d8 ^ d9 ^ d10 ^ d11;

  // Montagem da palavra de saída (bits de paridade nas posições corretas)
  assign saida = {d11, d10, d9, d8, d7, d6, d5, p8, d4, d3, d2, p4, d1, p2, p1};

endmodule