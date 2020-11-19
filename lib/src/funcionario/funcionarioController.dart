
import 'package:SGFP/src/funcionario/funcionarioModel.dart';
import 'package:SGFP/src/funcionario/funcionarioService.dart';
import 'package:http_server/http_server.dart';
import 'dart:convert';


class FuncionarioController {
  
  final FuncionarioService funcionarioService = new FuncionarioService();

  List<Funcionario> funcionarios = [];
  Funcionario funcionario = new Funcionario();

  HttpRequestBody _reqBody;

  FuncionarioController(this._reqBody){
    handle();
  }

  handle() async {
    switch (this._reqBody.request.method) {
      case 'GET':
        funcionarios = await funcionarioService.getFuncioncarios();
        _reqBody.request.response.write(funcionarios);
        break;
      case 'POST':
        funcionario = await funcionarioService.addFuncionario( _reqBody.body  );
        _reqBody.request.response.write(funcionario);
        break;
      case 'PATCH':
        var id = int.parse(_reqBody.request.uri.queryParameters['id']);
        funcionario = await funcionarioService.updateFuncionario( _reqBody.body, id  );
        _reqBody.request.response.write(funcionario);
        break;
      case 'DELETE':
        var id = int.parse(_reqBody.request.uri.queryParameters['id']);
        funcionario = await funcionarioService.deleteFuncionario( id );
        _reqBody.request.response.write(funcionario);
        break;
      default:
        _reqBody.request.response.statusCode = 405;
    }

    await _reqBody.request.response.close();
  }

}
