import 'dart:io';

import 'package:SGFP/src/folhaPagamento/folhaPagamentoController.dart';
import 'package:SGFP/src/funcionario/FuncionarioController.dart';
import 'package:http_server/http_server.dart';
import 'package:mongo_dart/mongo_dart.dart';

void main() async {

  String host = '0.0.0.0';
  int port = 8085;

  var server = await HttpServer.bind(host, port);

  print('Servidor rodando em  http://$host:$port');

  Db db = Db('mongodb://localhost:27017/test');
  await db.open();
  print('Conectado no Banco de Dados');

  server.transform(HttpBodyHandler()).listen((HttpRequestBody reqBody) async {
    var request = reqBody.request;
    var response = request.response;

    request.response.headers.add('Access-Control-Allow-Origin', '*');
    request.response.headers.add('Access-Control-Allow-Methods', 'POST,GET,DELETE,PUT,PATCH,OPTIONS');

    FuncionarioController funcionarioController;
    FolhaPagamentoController folhaPagamentoController;

    switch (request.uri.path) {
      case '/':
        response.write('Olá SGFP!');
        await response.close();
        break;
      case '/funcionario':
        funcionarioController = FuncionarioController(reqBody,db);
        funcionarioController.handle().catchError((e) => print(e));
        break;
      case '/folhaPagamento':
        folhaPagamentoController = FolhaPagamentoController(reqBody,db);
        folhaPagamentoController.handle().catchError((e) => print(e));
        break;
      case '/folhaPagamento/calcular':
        folhaPagamentoController = FolhaPagamentoController(reqBody,db);
        folhaPagamentoController.handleCalcular().catchError((e) => print(e));
        break;
      default:
        response
          ..statusCode = HttpStatus.notFound
          ..write('Not Found');
        await response.close();
    }

  });

}
