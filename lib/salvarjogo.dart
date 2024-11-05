import './databaseclass.dart';
import './tabuleiro.dart';
import './verificarvencedor.dart';



void SalvarJogo(String valor0, valor1, valor2, valor3, valor4, valor5, valor6, valor7, valor8, vencedor) async {
  Map<String, dynamic> partida = {
    "posicao_0": valor0,
    "posicao_1": valor1,
    "posicao_2": valor2,
    "posicao_3": valor3,
    "posicao_4": valor4,
    "posicao_5": valor5,
    "posicao_6": valor6,
    "posicao_7": valor7,
    "posicao_8": valor8,
    "vencedor": vencedor,
    "data_jogo": DateTime.now().toString(),
  };

  await DatabaseClass.instance.salvarJogo(partida);
}
