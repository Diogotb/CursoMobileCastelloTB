import 'package:flutter/material.dart';

import 'tela_cadastro.dart';
import 'tela_inicial.dart';
import 'tela_principal.dart';

void main(){
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => TelaInicial(),
      "/cadastro": (context) => TelaCadastro(),
      "/principal": (context) => TelaPrincipal(),
    },
    theme: ThemeData(brightness: Brightness.light),
    darkTheme: ThemeData(brightness: Brightness.dark),
  ));
}