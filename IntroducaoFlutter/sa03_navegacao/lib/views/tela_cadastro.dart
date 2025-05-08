import 'package:flutter/material.dart';

//chama a modificação
class TelaCadastro extends StatefulWidget{
  const TelaCadastro({super.key});

  @override
  _TelaCadastroState createState() => _TelaCadastroState(); 
}

//tem o contrutor
class _TelaCadastroState extends State<TelaCadastro>{
  //atributos
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  double _idade = 0;
  bool _aceite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro"), centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nome"),
            TextField(controller: _nomeController,),
            SizedBox(height: 20,),
            Text("Email"),
            TextField(controller: _emailController,),
            SizedBox(height: 20,),
            Text("Idade"),
            Slider(
              value: _idade,
              min: 0,
              max: 99,
              divisions: 99,
              label: _idade.round().toString(),
              onChanged: (value){
                setState(() {
                  _idade = value;
                });
              }),
            SizedBox(height: 20,),
            CheckboxListTile(
              value: _aceite,
              title: Text("Aceito os Termos de Uso"), 
              onChanged: (value) => setState(()=>_aceite=value!)),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: _enviarCadastro, 
              child: Text("Enviar"))
          ],
        ),
        ),  
    );
  }

  void _enviarCadastro() {
    if(_nomeController.text.isNotEmpty && _emailController.text.isNotEmpty && _idade>-18 && _aceite){
      Navigator.pushNamed(context, "/confirmacao");
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Verifique seu Cadastro") ));
    }

  }

}