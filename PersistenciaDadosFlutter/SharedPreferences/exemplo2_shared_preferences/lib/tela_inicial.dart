import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaInicial extends StatefulWidget{
  const TelaInicial({super.key});
 //Tela com Mudança de Estado
  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial>{ //Tela que verifica as mudanças 
  //atributos
  String _nome = ""; // _ indica que o atributo é privado
  String _email = "";
  final TextEditingController _nomeController = TextEditingController(); //Controlador do Campo de Text 
  final TextEditingController _emailController = TextEditingController();
  bool _darkMode = false; //Atributo para o modo escuro
  bool _logado = false; //atributo para verificar se o usuário está logado

  //métodos
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _carregarPreferencias(); //carregar as preferencias do usuário - 
    if(_logado){
      Navigator.pushNamed(context, "/principal"); //navega para tela principal
    }
  }
  
  _carregarPreferencias() async {
    // conectar com shared Preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nome = prefs.getString("nome") ?? "";// carrega as informações da chave nome, caso não tenha carrega ""
      _email = prefs.getString("_nome") ?? "";
      _darkMode = prefs.getBool("darkMode") ?? false;
      _logado = prefs.getBool("logado") ?? false;
    });
  }

  _trocarTema() async{
    SharedPreferences prefs = await SharedPreferences.getInstance(); 
    setState(() {
      _darkMode = !_darkMode; //Troca o Tema
      prefs.setBool("darmoMode", _darkMode); //salva o tema no cache
    });
  }

  _logar() async{
    _nome = _nomeController.text.trim();
    _email = _emailController.text.trim();
    SharedPreferences prefs = await SharedPreferences.getInstance(); //conecta com o shared
    if(_nomeController.text.trim().isEmpty || _emailController.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Preencha todos os Campos!")));
    }else if(prefs.getString(_nome) == _email){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Realizado com Sucesso!")));
      prefs.setString("nome", _nome); //salva o nome no cache
      prefs.setBool("logado", true); //salva o login no cache
      _nomeController.clear();
      _emailController.clear();
      Navigator.pushNamed(context, "/principal"); //navega para a tela principal      
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login ou Email Inválido!")));
    }
  }

  @override
  Widget build(BuildContext context){
    return AnimatedTheme(
      data:  _darkMode ? ThemeData.dark() : ThemeData.light(), //troca a cor do tema
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bem-vindo ${_nome =="" ? "Visitante" : _nome}"), // se nome vazio escreve Visitante
          actions: [
            IconButton(
              onPressed: _trocarTema, //trocar tema
              icon: Icon(_darkMode ? Icons.light_mode : Icons.dark_mode))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Fazer Login", style: TextStyle(fontSize: 20),),
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: "Nome"),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: _logar,
                child: Text("Logar"),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/cadastro"),
                child: Text("Cadastrar"))
            ],
            ),
         )
      ),
    );
  }
}