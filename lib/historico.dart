import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './databaseclass.dart';
import './tabuleiro.dart';

class Historico extends StatelessWidget {
  const Historico({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de partidas'),
      ),
      body: FutureBuilder(
        future: DatabaseClass.instance.recuperarJogos(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            final jogos = snapshot.data!;
            return ListView.builder(
              itemCount: jogos.length,
              itemBuilder: (BuildContext context, int index) {
                final jogo = jogos[index];
                return GestureDetector(
                    onTap: () => showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: HistoricoZOOM(
                                  valor0: jogo['posicao_0'],
                                  valor1: jogo['posicao_1'],
                                  valor2: jogo['posicao_2'],
                                  valor3: jogo['posicao_3'],
                                  valor4: jogo['posicao_4'],
                                  valor5: jogo['posicao_5'],
                                  valor6: jogo['posicao_6'],
                                  valor7: jogo['posicao_7'],
                                  valor8: jogo['posicao_8'],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Fechar',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 210, 148, 5),
                                          )))
                                ]);
                          },
                        ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: ListTile(
                        title: Text(jogo['data_jogo']),
                        subtitle: Text(jogo['vencedor']),
                      ),
                    ));
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class HistoricoZOOM extends StatelessWidget {
  final String valor0;
  final String valor1;
  final String valor2;
  final String valor3;
  final String valor4;
  final String valor5;
  final String valor6;
  final String valor7;
  final String valor8;

  const HistoricoZOOM({
    super.key,
    required this.valor0,
    required this.valor1,
    required this.valor2,
    required this.valor3,
    required this.valor4,
    required this.valor5,
    required this.valor6,
    required this.valor7,
    required this.valor8,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuadradoTabuleiro(filling: valor0),
            QuadradoTabuleiro(filling: valor1),
            QuadradoTabuleiro(filling: valor2),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuadradoTabuleiro(filling: valor3),
            QuadradoTabuleiro(filling: valor4),
            QuadradoTabuleiro(filling: valor5),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuadradoTabuleiro(filling: valor6),
            QuadradoTabuleiro(filling: valor7),
            QuadradoTabuleiro(filling: valor8),
          ],
        ),
      ],
    );
  }
}
