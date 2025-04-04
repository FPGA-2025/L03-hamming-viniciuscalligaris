module injetor(
  input [14:0] entrada,
  input [3:0] n,
  input erro,
  output reg [14:0] saida
);

  always @(*) begin
    saida = entrada;

    // erro = 1, inverte o bit na posição 'n'
    if (erro && n < 15) begin
        saida[n] = ~saida[n];
    end
  end

endmodule