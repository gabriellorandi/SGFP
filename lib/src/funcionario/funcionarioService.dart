import 'dart:async';

import 'package:SGFP/src/funcionario/funcionarioModel.dart';
import 'package:angular/core.dart';

@Injectable()
class FuncionarioService {

  List<Funcionario> funcionarios = <Funcionario>[];

  Future<List<Funcionario>> getFuncioncariosList() async => funcionarios;

}
