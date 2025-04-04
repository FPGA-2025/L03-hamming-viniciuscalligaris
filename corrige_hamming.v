module corrige_hamming (
  input [14:0] entrada,
  output reg [10:0] saida
);
  wire p1, p2, p4, p8;
  wire [3:0] bit_errado;
  reg [14:0] corrigida;

  assign p1 = entrada[0] ^ entrada[2] ^ entrada[4] ^ entrada[6] ^ entrada[8] ^ entrada[10] ^ entrada[12] ^ entrada[14];
  assign p2 = entrada[1] ^ entrada[2] ^ entrada[5] ^ entrada[6] ^ entrada[9] ^ entrada[10] ^ entrada[13] ^ entrada[14];
  assign p4 = entrada[3] ^ entrada[4] ^ entrada[5] ^ entrada[6] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];
  assign p8 = entrada[7] ^ entrada[8] ^ entrada[9] ^ entrada[10] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];

  // Posição do bit errado
  assign bit_errado = {p8, p4, p2, p1};

  always @(*) begin
    corrigida = entrada;

    // Se houver erro invertemos o bit errado
    if (bit_errado != 0) begin
        corrigida[bit_errado-1] = ~corrigida[bit_errado-1];
    end

    // Remove os bits de paridade para obter apenas a palavra corrigida de 11 bits
    saida = {corrigida[14],corrigida[13],corrigida[12],corrigida[11],corrigida[10], 
             corrigida[9],corrigida[8],corrigida[6],corrigida[5],corrigida[4],corrigida[2]};
  end

endmodule
