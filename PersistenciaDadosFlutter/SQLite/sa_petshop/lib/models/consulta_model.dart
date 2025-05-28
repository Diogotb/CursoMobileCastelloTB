import 'package:intl/intl.dart';

class Consulta{
  final int? id; //pode ser nulo
  final int petId; //chave estrangeita
  final DateTime dataHora;
  final String tipoServico;
  final String observacao;

  Consulta({
    this.id,
    required this.petId,
    required this.dataHora,
    required this.tipoServico,
    required this.observacao
  });

  // toMap : Obj => BD
  Map<String,dynamic> toMap() => {
    "id":id,
    "pet_id":petId,
    "data_hora": dataHora.toIso8601String(), // padrão internacional de hora para BD
    "tipo_servico":tipoServico,
    "observacao":observacao
  };

  //fromMap() : BD => obj
  factory Consulta.fromMap(Map<String,dynamic> map) => 
    Consulta(
      id: map["id"] as int,
      petId: map["pet_id"] as int, 
      dataHora: DateTime.parse(map["data_hora"] as String), 
      tipoServico: map["tipo_servico"] as String, 
      observacao: map["observacao"] as String);

  // método de conversão de DAta e hora para formato BR (intl)
  String get dataHoraLocal {
    final local = DateFormat("dd/MM/yyyy HH:mm");
    return local.format(dataHora);
  }

}