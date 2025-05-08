import 'package:flutter/material.dart';

class TelaBoasvindas extends StatelessWidget{
  const TelaBoasvindas({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Bem-vindo!"),centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bem-vindo ao nosso App",style: TextStyle(fontSize: 20) ,),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: ()=> Navigator.pushNamed(context, "/cadastro"), 
              child: Text("Inicar Cadastro"))
          ],
        ),
      ),
    );
  }
}