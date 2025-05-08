//janela inical do aplicativo
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaInicial extends StatefulWidget{
  const TelaInicial({super.key});
// janela com alteração de estado (setState)
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

//construção da Janela do Página
class _TelaInicialState extends State<TelaInicial>{
  //atributos
  final TextEditingController _nomeController = TextEditingController();
  String _nome = "";
  bool _darkMode = false;

  // métodos
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _carregarNome();
  }

  void _salvarPreferencias() async { //método vai rodar de forma assincrona
    if(_nomeController.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Preencha o Nome do Usuário")));
    }else{
      SharedPreferences prefs = await SharedPreferences.getInstance(); // espera estabelece a conexão para pegar a informação (await)
      _nome = _nomeController.text;
      //salvar no shared preference a chave / valor
      prefs.setString("nome",_nome);
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Nome do Usuário Preenchido")));
        _nomeController.clear();
      });
    }
  }

  void _mudarTema() async{
    _darkMode = !_darkMode; //inverte o valor da boolean
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("darkMode",_darkMode);
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_darkMode ? "Modo Escuro" : "Modo Claro")));
    });
  }

  void _carregarNome() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nome = prefs.getString("nome") ?? ""; //carrega a informação do da chave "nome" , caso nulo carrega ""
      _darkMode = prefs.getBool("darkMode") ?? false;
    });
  }

  @override
  Widget build (BuildContext context){//construtor de Janela
    return AnimatedTheme(
      data: _darkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bem-Vindo ${_nome=="" ? "Visitante" : _nome}"),//operador Ternário
          actions: [IconButton(
            onPressed: _mudarTema, 
            icon: Icon(_darkMode ? Icons.light_mode : Icons.dark_mode))],
        ), 
      
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: "Nome do Usuário"),
              ),
              ElevatedButton(
                onPressed: _salvarPreferencias, 
                child: Text("Salvar Usuário"))
            ],
          ),),
      ),
    );
  }
}
