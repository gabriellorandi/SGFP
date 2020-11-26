import 'dart:io';

import 'package:SGFP/src/folhaPagamento/folhaPagamentoController.dart';
import 'package:SGFP/src/funcionario/FuncionarioController.dart';
import 'package:http_server/http_server.dart';
import 'package:mongo_dart/mongo_dart.dart';

String _host = InternetAddress.loopbackIPv4.host;

void main() async {

  int port = 8085;

  var server = await HttpServer.bind(_host, port);

  print('Servidor rodando em  http://$_host:$port');

  Db db = Db('mongodb://localhost:27017/test2');
  await db.open();
  print('Conectado no Banco de Dados');

  server.transform(HttpBodyHandler()).listen((HttpRequestBody reqBody) async {
    var request = reqBody.request;
    var response = request.response;

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
