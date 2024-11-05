import 'package:flutter/material.dart';
import './verificarvencedor.dart';
import './salvarjogo.dart';
import './historico.dart';

class InterfaceJogo extends StatelessWidget {
  const InterfaceJogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height) / 7,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Historico()),
                );
              },
              icon: const Icon(
                Icons.emoji_events,
                size: 70,
                color:  Color.fromARGB(255, 210, 148, 5),
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height) / 10,
            ),
            const InterfaceTabuleiro(),
          ],
        ),
      ),
    );
  }
}

class InterfaceTabuleiro extends StatefulWidget {
  const InterfaceTabuleiro({super.key});

  @override
  _InterfaceTabuleiroState createState() => _InterfaceTabuleiroState();
}

class _InterfaceTabuleiroState extends State<InterfaceTabuleiro> {
  final List<String> jogada = List.filled(9, ''); // Lista para armazenar X e O
  bool vezDoX = true; // Controla de quem é a vez
  String vez = '';
  String? vencedor;
  final VerificarVencedor verificadorVencedor = VerificarVencedor();

  void _realizarJogada(int index) {
    if (jogada[index] == '') {
      setState(() {
        jogada[index] = vezDoX ? 'X' : 'O';
        vez = vezDoX ? 'O' : 'X';
        vezDoX = !vezDoX;
        String mensagem = '';

        vencedor = verificadorVencedor.verificarVencedor(jogada);

        if (vencedor != null) {
          SalvarJogo(
            jogada[0],
            jogada[1],
            jogada[2],
            jogada[3],
            jogada[4],
            jogada[5],
            jogada[6],
            jogada[7],
            jogada[8],
            vencedor,
          );

          if (vencedor == 'Empate') {
            mensagem = ', Deu velhaa!!!!';
          } else {
            mensagem = ', Parabéns! Você venceu!';
          }
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Column(children: [
                  const Icon(
                    Icons.emoji_events,
                    size: 50,
                    color: Color.fromARGB(255, 210, 148, 5),
                  ),
                  Text(
                    ' $vencedor $mensagem',
                    style: TextStyle(fontSize: 20),
                  )
                ]),
                actions: [
                  TextButton(
                    onPressed: () {
                      // Reiniciar o jogo
                      Navigator.of(context).pop();
                      setState(() {
                        jogada.fillRange(
                            0, 9, ''); // preenche cada espaço com ''
                        vezDoX = true; // inicia com x
                        vez = 'X';
                        vencedor = null;
                      });
                    },
                    child: const Text(
                      'Recomeçar',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 210, 148, 5),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Vez de: $vez',
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuadradoTabuleiro(
                filling: jogada[0], onTap: () => _realizarJogada(0)),
            QuadradoTabuleiro(
                filling: jogada[1], onTap: () => _realizarJogada(1)),
            QuadradoTabuleiro(
                filling: jogada[2], onTap: () => _realizarJogada(2)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuadradoTabuleiro(
                filling: jogada[3], onTap: () => _realizarJogada(3)),
            QuadradoTabuleiro(
                filling: jogada[4], onTap: () => _realizarJogada(4)),
            QuadradoTabuleiro(
                filling: jogada[5], onTap: () => _realizarJogada(5)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuadradoTabuleiro(
                filling: jogada[6], onTap: () => _realizarJogada(6)),
            QuadradoTabuleiro(
                filling: jogada[7], onTap: () => _realizarJogada(7)),
            QuadradoTabuleiro(
                filling: jogada[8], onTap: () => _realizarJogada(8)),
          ],
        ),
      ],
    );
  }
}

class QuadradoTabuleiro extends StatelessWidget {
  final String filling;
  final VoidCallback? onTap;

  const QuadradoTabuleiro(
      {super.key, required this.filling, this.onTap});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tam = width / 6;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: tam,
        height: tam,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          filling,
          style: const TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
