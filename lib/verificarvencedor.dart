
class VerificarVencedor{
    String? verificarVencedor(List<String> jogada) {
        //verificar linhas
        //colunas e 
        // diagonais
        final combinacoesVencedoras = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [0, 4, 8],
            [2, 4, 6]
        ];
        
        // abaixo entramos em um loop que verifica cada posição do jogo
        //o loop acessa o endereço de memória de cada posição do jogo
        //se achar valores iguais em uma das posiçoes armazenadas, temos um vencendor
      for (var combinacao in combinacoesVencedoras) {
        var a = combinacao[0];
        var b = combinacao[1];
        var c = combinacao[2];
        
        if (jogada[a] != '' && jogada[a] == jogada[b] && jogada[a] == jogada[c]) {
          return jogada[a]; //retorna o vencedor
        }
      }
      if (!jogada.contains('')) {
          return 'Empate'; //retorna empate quando todos meus espaços estiverem preenchidos
          //mas n tivermos um vencedor
        }
      return null;  
    }
}
