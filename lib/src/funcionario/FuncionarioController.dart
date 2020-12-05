
import 'package:SGFP/src/funcionario/Funcionario.dart';
import 'package:SGFP/src/funcionario/FuncionarioService.dart';
import 'package:SGFP/src/util/ErrorHandler.dart';
import 'package:http_server/http_server.dart';
import 'dart:convert';

class FuncionarioController {
  
  FuncionarioService employeeService;

  List<Funcionario> employees = [];
  Funcionario employee = new Funcionario();

  HttpRequestBody _reqBody;

  FuncionarioController(this._reqBody,db) {
    employeeService = new FuncionarioService(db);
  }

  Future handle() async {
    switch (this._reqBody.request.method) {
      case 'GET':
        employees = await employeeService.getFuncionarios();
        _reqBody.request.response.write(jsonEncode(employees));
        await close(_reqBody);
        break;
      case 'POST':
        employee = await employeeService.addFuncionario( _reqBody.body  )
            .catchError( (e) => ErrorHandler.onError( e,_reqBody));
        _reqBody.request.response.write(jsonEncode(employee));
        await close(_reqBody);
        break;
      case 'PATCH':
        var id = _reqBody.request.uri.queryParameters['id'];

        if(id == null || id.isEmpty ) {
          ErrorHandler.onError("Id inválido.",_reqBody);
          throw FormatException("Id inválido.");
        }

        employee = await employeeService.updateFuncionario( _reqBody.body, id  )
            .catchError( (e) => ErrorHandler.onError( e,_reqBody));
        _reqBody.request.response.write(jsonEncode(employee));
        await close(_reqBody);
        break;
      case 'DELETE':
        var id = _reqBody.request.uri.queryParameters['id'];

        if(id == null || id.isEmpty ) {
          ErrorHandler.onError("Id inválido.",_reqBody);
          throw FormatException("Id inválido.");
        }

        employee = await employeeService.deleteFuncionario( id )
            .catchError( (e) => ErrorHandler.onError( e,_reqBody));
        _reqBody.request.response.write(jsonEncode(employee));
        await close(_reqBody);
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
