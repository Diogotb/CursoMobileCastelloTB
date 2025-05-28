import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaPrincipal extends StatefulWidget{
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal>{
  // atributos
  String _nome = "";
  bool _darkMode = false;
  bool _logado = true;
  List<String> _tarefas = [];
  final TextEditingController _tarefaController = TextEditingController();

  //métodos
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _carregarPreferrencias(); //carrega as prefs 
  }

  _carregarPreferrencias() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nome = prefs.getString("nome") ?? ""; 
      _darkMode = prefs.getBool("darkMode") ?? false;
      _logado = prefs.getBool("logado") ?? false;
      _tarefas = prefs.getStringList(_nome) ?? [];
    });

  }

  @override
  Widget build(BuildContext context){
    return AnimatedTheme(
      data: _darkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(title: Text("Tarefas de $_nome"),actions: [
          IconButton(
            onPressed: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              _logado = false;
              prefs.setBool("logado", _logado);
              Navigator.pushNamed(context, "/");
            }, 
            icon: Icon(Icons.logout))
        ],),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: _tarefas.length,
            itemBuilder: (context,index) {
              return ListTile(
                title: Text(_tarefas[index]),
              );
            }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(
              context: context, 
              builder: (context) => AlertDialog(
                title: Text("Nova Tarefa"),
                content: TextField(
                  controller: _tarefaController,
                  decoration: InputDecoration(hintText: "Digite uma Tarefa"),
                ),
                actions: [
                  TextButton(
                    onPressed: _adicionarTarefa, 
                    child: Text("Adicionar"))
                ],
              )
            );
          },
          child: Icon(Icons.add),),
      ),
    );
  }

  _adicionarTarefa() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(_tarefaController.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("A tarefa está vazia")));
    }else{
      _tarefas.add(_tarefaController.text.trim()); // adicionanado o texto dentro da lista de text (ListString)
      prefs.setStringList(_nome, _tarefas);
      setState(() {
        _tarefaController.clear();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Tarefa Adiconada com Sucesso")));
        Navigator.pop(context);//fecho alertDialog        
      });
    }


  }

}