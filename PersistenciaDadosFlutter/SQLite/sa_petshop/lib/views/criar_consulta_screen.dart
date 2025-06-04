// tela para criar o serviço para o Pet

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sa_petshop/controllers/consulta_controller.dart';
import 'package:sa_petshop/models/consulta_model.dart';
import 'package:sa_petshop/views/detalhe_pet_screen.dart';

class CriarConsultaScreen  extends StatefulWidget{
  final int petId; //recebo o Id do Pet

  CriarConsultaScreen({super.key, required this.petId});

  @override
  State<StatefulWidget> createState() {
    return _CriarConsultaScreenState();
  }
}

class _CriarConsultaScreenState extends State<CriarConsultaScreen>{
  //formulario
  final _formKey = GlobalKey<FormState>();
  final _consultasControl = ConsultaController();

  late String _tipoServico;
  late String _observacao;
  DateTime _selectedDate = DateTime.now(); //não pode selecionar uma data anterior a data atual
  TimeOfDay _selectedTime = TimeOfDay.now(); //não pode selecioanr uma hora anterior a data atual

  //método para Seleção da Data
  void _dataSelecionada(BuildContext context) async{
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(), 
      lastDate: DateTime(2030),
      );
    if(picked != null && picked != _selectedDate){
      setState(() {
        _selectedDate = picked;
      });
    }
  }
  //método para Seleção de Hora
  void _horaSelecionada(BuildContext context) async{
    final TimeOfDay? picked = await showTimePicker(
      context: context, 
      initialTime: _selectedTime);
    if(picked != null && picked != _selectedDate){
      setState(() {
        _selectedTime = picked;
      });
    }
  }
  //Salvar a Consulta
  void _salvarConsulta() async{
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save(); //Salva os Valores do Formulário

      //Correção de Data
      final DateTime dataFinal = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _selectedTime.hour,
        _selectedTime.minute
      );

      final newConsulta = 
      Consulta(
        petId: widget.petId, 
        dataHora: dataFinal, 
        tipoServico: _tipoServico, 
        observacao: _observacao.isEmpty ? "." : _observacao);
      
      try {
        await _consultasControl.createConsulta(newConsulta);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Agendamento Feito com Sucesso"))
        );
        Navigator.push(context, 
          MaterialPageRoute(builder: (context)=>DetalhePetScreen(petId: widget.petId)));
        
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Exception: $e"))
        );
      }
    }
  }

  //buildar a Tela
  @override
  Widget build(BuildContext context) {
    //formatação para data e Hora
    final DateFormat dataFormatada = DateFormat("dd/MM/yyyy");
    final DateFormat horaFormatada = DateFormat("HH:mm");

    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Agendamento"),
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "tipo de Serviço"),
              validator: (value) => value!.isEmpty ? "Campo deve Ser Preenchido" : null,
              onSaved: (newValue) => _tipoServico = newValue!,
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child: Text("Data: ${dataFormatada.format(_selectedDate)}")),
                TextButton(onPressed: ()=>_dataSelecionada(context), child: Text("Selecionar Data"))
              ],
            ),
            Row(
              children: [
                Expanded(child: Text("Data: ${horaFormatada.format(
                  DateTime(0,0,0,_selectedTime.hour,_selectedTime.minute))}")),
                TextButton(onPressed: ()=>_horaSelecionada(context), child: Text("Selecionar Hora"))
              ],
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(labelText: "Observação"),
              maxLines: 3,
              onSaved: (newValue) => _observacao=newValue!,
            ),
            ElevatedButton(onPressed: _salvarConsulta, child: Text("Agendar Atendimento"))
            
          ],
        )),)
    );
  }


}