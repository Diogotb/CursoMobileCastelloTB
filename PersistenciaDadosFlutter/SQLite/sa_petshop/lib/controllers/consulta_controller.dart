import 'package:sa_petshop/models/consulta_model.dart';
import 'package:sa_petshop/services/db_helper.dart';

class ConsultaController {
  //atributo
  final _dbHelper = DbHelper();

  // métodos

  // create
  createConsulta(Consulta consulta) async{
    return _dbHelper.insertConsulta(consulta);
  }

  //readConsultaByPet
  readConsultaByPet(int petId) async {
    return _dbHelper.getConsultaByPetId(petId);
  }

  //deleteConsulta
  deleteConsulta(int id) async{
    return _dbHelper.deleteConsulta(id);
  }
}