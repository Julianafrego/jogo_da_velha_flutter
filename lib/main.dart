import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Remova ou ajuste o caminho do arquivo abaixo, caso não exista.
// import 'package:jogp_da_velha_flutter/tabuleiro.dart';
import './tabuleiro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo da Velha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
  
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      home: const InterfaceJogo(),
    );
  }
}
