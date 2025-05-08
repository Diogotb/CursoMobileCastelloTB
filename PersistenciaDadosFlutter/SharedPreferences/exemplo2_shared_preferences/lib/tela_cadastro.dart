import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaCadastro extends StatelessWidget {
  //atributos
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

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
    String _nome = _nomeController.text.trim();
    String _email = _emailController.text.trim();
    if(_nome.isEmpty || _email.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Preencha todos os Campos!")));
    } else{
      SharedPreferences _prefs = await SharedPreferences.getInstance(); 
      _prefs.setString(_nome, _email); //salva na chame nome o email
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Usuário Cadastrado com Sucesso!!!")));
      _nomeController.clear();
      _emailController.clear();
      Navigator.pushNamed(context, "/"); // navega para tela inicial
    }
  }
}
