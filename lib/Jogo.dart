// ignore_for_file: file_names

import 'dart:math';
import 'package:flutter/material.dart';


class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imageApp = const AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

   _opcaoSelecionada(String escolhaUsuario) {

    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];


    switch (escolhaApp) {
      case "pedra":
        setState(() {
          _imageApp = const AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imageApp = const AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imageApp = const AssetImage("images/tesoura.png");
        });
        break;
    }
    if(
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
      (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ) {
      setState(() {
        _mensagem = "Parabéns! Você ganhou :)";
      });
    } else if(
      (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
      (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
      (escolhaApp == "papel" && escolhaUsuario == "pedra")
    ) {
      setState(() {
        _mensagem = "Você perdeu :(";
      });
    } else {
      setState(() {
        _mensagem = "Empatamos ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JokenPo'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do Sistema',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: _imageApp),
          Padding(
            padding: const EdgeInsets.only(top: 72, bottom: 32),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () =>
                _opcaoSelecionada("papel"), child: Image.asset("images/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"), child: Image.asset("images/tesoura.png", height: 100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}