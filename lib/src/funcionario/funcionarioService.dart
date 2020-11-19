import 'dart:async';

import 'package:SGFP/src/funcionario/funcionarioModel.dart';

class FuncionarioService {

  static List<Funcionario> funcionarios = <Funcionario>[];

  static Future<List<Funcionario>> getFuncioncarios() async => funcionarios;

  static Future<Funcionario>  addFuncionario(var json ) async {
    Funcionario funcionario = Funcionario.fromJson(json);
    funcionarios.add( funcionario );
    return funcionario;
  }

  static Future<Funcionario>  deleteFuncionario(int id) async {
    Funcionario funcionario = await findById(id);

    if(funcionario != null) {
      funcionarios.remove(funcionario);
    }
    return funcionario;
  }

  static Future<Funcionario> updateFuncionario(Funcionario funcionario, int id) async {

    Funcionario update = await findById(id);

    if(update != null) {
      update = funcionario;
    }

    return funcionario;

  }

  static Future<Funcionario>  findById(int id) async {
    for(Funcionario f in funcionarios) {
      if(f.id == id) {
        return f;
      }
    }
    return null;
  }

}
