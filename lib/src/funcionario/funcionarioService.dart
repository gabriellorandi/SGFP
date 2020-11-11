import 'dart:async';

import 'package:SGFP/src/funcionario/funcionarioModel.dart';
import 'package:angular/core.dart';

@Injectable()
class FuncionarioService {
  List<Funcionario> mockTodoList = <Funcionario>[];

  Future<List<Funcionario>> getFuncioncarioList() async => mockTodoList;
}
