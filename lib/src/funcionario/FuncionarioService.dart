import 'dart:async';

import 'package:SGFP/src/funcionario/Funcionario.dart';
import 'package:mongo_dart/mongo_dart.dart';

class FuncionarioService {

  DbCollection funcionarioDB;

  FuncionarioService(db) {
    funcionarioDB = db.collection('funcionario');
  }

  Future<List<Funcionario>> getFuncionarios() 
    async => await funcionarioDB.find().map((f) => Funcionario.fromJson(f) ).toList();

  Future<Funcionario>  addFuncionario(var json ) async {
    Funcionario funcionario = Funcionario.fromJson(json);
    await funcionarioDB.save( json );
    return funcionario;
  }

  Future<Funcionario>  deleteFuncionario(String id) async {
    Funcionario funcionario = await findById(id);

    if(funcionario != null) {
      await funcionarioDB.remove(where.id(ObjectId.parse(id)));
    }
    return funcionario;
  }

  Future<Funcionario> updateFuncionario(var json, String id) async {

    Funcionario update = await findById(id);

    if(update != null) {
      update =  Funcionario.fromJson( await funcionarioDB.update( where.id(ObjectId.parse(id)), json ) );
    }

    return update;

  }

  Future<Funcionario>  findById(String id) async {
    return Funcionario.fromJson( await funcionarioDB.findOne(where.id(ObjectId.parse(id)) ) );
  }

}
