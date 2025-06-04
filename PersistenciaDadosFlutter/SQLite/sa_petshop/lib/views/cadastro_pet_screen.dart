import 'package:flutter/material.dart';
import 'package:sa_petshop/controllers/pet_controller.dart';
import 'package:sa_petshop/models/pet_model.dart';
import 'package:sa_petshop/views/home_screen.dart';

class CadastroPetScreen  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CadastroPetScreenState();
  }
}

class _CadastroPetScreenState extends State<CadastroPetScreen>{
  final _formKey = GlobalKey<FormState>(); // chave para o formulário
  final _petsController = PetController();

  //late
  late String _nome;
  late String _raca;
  late String _nomeDono;
  late String _telefone;

  _salvarPet() async{
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      final newPet = Pet(
        nome: _nome, 
        raca: _raca, 
        nomeDono: _nomeDono, 
        telefone: _telefone);
      await _petsController.createPet(newPet);
      Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
    }
  }

  //buildar a Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Pet"),),
      body: Padding(padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Nome do Pet"),
              validator: (value) => value!.isEmpty ? "Campo não Preenchido" : null,
              onSaved: (newValue) => _nome = newValue!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Raça do Pet"),
              validator: (value) => value!.isEmpty ? "Campo não Preenchido" : null,
              onSaved: (newValue) => _raca = newValue!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Dono do Pet"),
              validator: (value) => value!.isEmpty ? "Campo não Preenchido" : null,
              onSaved: (newValue) => _nomeDono = newValue!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Telefone"),
              validator: (value) => value!.isEmpty ? "Campo não Preenchido" : null,
              onSaved: (newValue) => _telefone = newValue!,
            ),
            ElevatedButton(onPressed: _salvarPet, child: Text("Cadastrar"))
          ],
        )),),
    );
  }
}