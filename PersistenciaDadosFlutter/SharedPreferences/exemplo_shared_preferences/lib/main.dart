import 'package:flutter/material.dart';
import 'tela_inical.dart';

void main(){
  runApp(MaterialApp(
    title: "Exemplo Shared Preferences",
    home: TelaInicial(),
    theme: ThemeData(brightness: Brightness.light),
    darkTheme: ThemeData(brightness: Brightness.dark),
  ));
}