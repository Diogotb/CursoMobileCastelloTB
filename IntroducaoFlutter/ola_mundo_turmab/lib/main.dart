import 'package:flutter/material.dart';//android

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Meu Primeiro APP"),
        ),
        body: Center(
          child:Text("Olá, Mundo!!!")
        )
      )
    );
  }


}

