
import 'package:SGFP/src/funcionario/funcionarioModel.dart';
import 'package:SGFP/src/funcionario/funcionarioService.dart';
import 'package:http_server/http_server.dart';

class FuncionarioController {
  
  FuncionarioService funcionarioService;

  List<Funcionario> funcionarios = [];
  Funcionario funcionario = new Funcionario();

  HttpRequestBody _reqBody;

  FuncionarioController(this._reqBody,db){
    funcionarioService = new FuncionarioService(db);
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
        var id = _reqBody.request.uri.queryParameters['id'];
        funcionario = await funcionarioService.updateFuncionario( _reqBody.body, id  );
        _reqBody.request.response.write(funcionario);
        break;
      case 'DELETE':
        var id = _reqBody.request.uri.queryParameters['id'];
        funcionario = await funcionarioService.deleteFuncionario( id );
        _reqBody.request.response.write(funcionario);
        break;
      default:
        _reqBody.request.response.statusCode = 405;
    }

    await _reqBody.request.response.close();
  }

}
