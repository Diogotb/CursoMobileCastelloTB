import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaCadastro extends StatelessWidget {
  //atributos
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  TelaCadastro({super.key});

  //métodos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela de Cadastro")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: "Nome"),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _cadastrarUsuario(context),
              child: Text("Cadastrar"),
            ),
          ],
        ),
      ),
    );
  }

  _cadastrarUsuario(BuildContext context) async {
    String nome = _nomeController.text.trim();
    String email = _emailController.text.trim();
    if(nome.isEmpty || email.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Preencha todos os Campos!")));
    } else{
      SharedPreferences prefs = await SharedPreferences.getInstance(); 
      prefs.setString(nome, email); //salva na chame nome o email
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Usuário Cadastrado com Sucesso!!!")));
      _nomeController.clear();
      _emailController.clear();
      Navigator.pushNamed(context, "/"); // navega para tela inicial
    }
  }
}
