import 'package:flutter/material.dart';

class TelaConfirmacao extends StatelessWidget{
  const TelaConfirmacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro Confirmado"),centerTitle: true,),
      body: Center(
        child: Column(
          children: [
            Icon(Icons.check_circle, color: Colors.green,),
            SizedBox(height: 20,),
            Text("Cadastro realizado com sucesso!!!", style: TextStyle(fontSize: 20),),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/"), 
              child: Text("Volta para Início"))
          ],
        ),
      ),
    );
  }
}