import 'dart:async';

import 'package:SGFP/src/funcionario/funcionarioModel.dart';

class FuncionarioService {

  List<Funcionario> funcionarios = <Funcionario>[];

  Future<List<Funcionario>> getFuncioncarios() async => funcionarios;

  Future<Funcionario>  addFuncionario(var json ) async {
    Funcionario funcionario = Funcionario.fromJson(json);
    funcionarios.add( funcionario );
    return funcionario;
  }

  Future<Funcionario>  deleteFuncionario(int id) async {
    Funcionario funcionario = await findById(id);

    if(funcionario != null) {
      funcionarios.remove(funcionario);
    }
    return funcionario;
  }

  Future<Funcionario> updateFuncionario(var json, int id) async {

    Funcionario funcionario = Funcionario.fromJson(json);

    Funcionario update = await findById(id);

    if(update != null) {
      update = funcionario;
    }

    return funcionario;

  }

  Future<Funcionario>  findById(int id) async {
    for(Funcionario f in funcionarios) {
      if(f.id == id) {
        return f;
      }
    }
    return null;
  }

}
