import 'package:flutter/material.dart';
import 'package:sa03_navegacao/views/tela_boasvindas.dart';
import 'package:sa03_navegacao/views/tela_cadastro.dart';
import 'package:sa03_navegacao/views/tela_confirmacao.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      // nome_da_rota => Tela()
      "/": (context) => TelaBoasvindas(),
      "/cadastro": (context) => TelaCadastro(),
      "/confirmacao": (context) => TelaConfirmacao()
    },
  ));
}

