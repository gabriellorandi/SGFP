
import 'package:SGFP/src/funcionario/funcionarioModel.dart';
import 'package:SGFP/src/funcionario/funcionarioService.dart';
import 'package:SGFP/src/util/ErrorHandler.dart';
import 'package:http_server/http_server.dart';

class FuncionarioController {
  
  FuncionarioService funcionarioService;

  List<Funcionario> funcionarios = [];
  Funcionario funcionario = new Funcionario();

  HttpRequestBody _reqBody;

  FuncionarioController(this._reqBody,db){
    funcionarioService = new FuncionarioService(db);
    handle().catchError( (e) => print(e) );;
  }

  Future handle() async {
    switch (this._reqBody.request.method) {
      case 'GET':
        funcionarios = await funcionarioService.getFuncioncarios();
        _reqBody.request.response.write(funcionarios);
        break;
      case 'POST':
        funcionario = await funcionarioService.addFuncionario( _reqBody.body  )
            .catchError(ErrorHandler.onError((e) => e,_reqBody))
            .whenComplete(() => close(_reqBody));
        _reqBody.request.response.write(funcionario);
        break;
      case 'PATCH':
        var id = _reqBody.request.uri.queryParameters['id'];

        if(id == null || id.isEmpty ) {
          ErrorHandler.onError("Id inválido.",_reqBody);
          throw FormatException("Id inválido.");
        }

        funcionario = await funcionarioService.updateFuncionario( _reqBody.body, id  )
            .catchError(ErrorHandler.onError((e) => e,_reqBody))
            .whenComplete(() => close(_reqBody));
        _reqBody.request.response.write(funcionario);
        break;
      case 'DELETE':
        var id = _reqBody.request.uri.queryParameters['id'];

        if(id == null || id.isEmpty ) {
          ErrorHandler.onError("Id inválido.",_reqBody);
          throw FormatException("Id inválido.");
        }

        funcionario = await funcionarioService.deleteFuncionario( id )
            .catchError(ErrorHandler.onError((e) => e,_reqBody))
            .whenComplete(() => close(_reqBody));
        _reqBody.request.response.write(funcionario);
        break;
      default:
        _reqBody.request.response.statusCode = 405;
    }

    await close(_reqBody);
  }

  close(_reqBody) async {
    await _reqBody.request.response.close();
  }
}
