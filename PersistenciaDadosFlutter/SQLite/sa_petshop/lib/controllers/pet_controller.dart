import 'package:sa_petshop/models/pet_model.dart';
import 'package:sa_petshop/services/db_helper.dart';

class PetController {
  final DbHelper _dbHelper = DbHelper(); //obj da classe dbhelper

  //métodos do controller - Slim (magros)
  Future<int> createPet(Pet pet) async{
    return await _dbHelper.insertPet(pet);
  }

  Future<List<Pet>> readPets() async{
    return await _dbHelper.getPets();
  }

  Future<Pet?> readPetbyId(int id) async{
    return await _dbHelper.getPetbyId(id);
  }

  Future<int> deletePet(int id) async{
    return await _dbHelper.deletePet(id);
  }
}