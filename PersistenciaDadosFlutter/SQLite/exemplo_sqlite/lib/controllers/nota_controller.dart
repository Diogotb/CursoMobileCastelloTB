import 'package:exemplo_sqlite/models/nota_model.dart';
import 'package:exemplo_sqlite/services/nota_db_helper.dart';

class NotaController {
 
static final NotaDbHelper _dbHelper = NotaDbHelper();

 //criar os controller
 //insert
  Future<int> createNota(Nota nota) async{
    return await _dbHelper.insertNota(nota);
  }

  //get
  Future<List<Nota>> readNotas() async{
    return await _dbHelper.getNotas();
  }

  //update
  Future<int> updateNota(Nota nota) async{
    return await _dbHelper.updateNota(nota);
  }

  //delete
  Future<int> deleteNota(int id) async{
    return await _dbHelper.deleteNota(id);
  }

}