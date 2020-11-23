import 'dart:io';

import 'package:SGFP/src/folhaPagamento/folhaPagamentoController.dart';
import 'package:SGFP/src/funcionario/funcionarioController.dart';
import 'package:http_server/http_server.dart';
import 'package:mongo_dart/mongo_dart.dart';

String _host = InternetAddress.loopbackIPv4.host;

void main() async {

  int port = 8085;

  var server = await HttpServer.bind(_host, port);

  print('Servidor rodando em  http://$_host:$port');


  Db db = Db('mongodb://localhost:27017/test');
  await db.open();
  print('Conectado no Banco de Dados');

  server.transform(HttpBodyHandler()).listen((HttpRequestBody reqBody) async {
    var request = reqBody.request;
    var response = request.response;

    switch (request.uri.path) {
      case '/':
        response.write('Olá SGFP!');
        await response.close();
        break;
      case '/funcionario':
        FuncionarioController(reqBody,db);
        break;
      case '/folhaPagamento':
        FolhaPagamentoController(reqBody,db);
        break;
      case '/folhaPagamento/calcular':
        FolhaPagamentoController.calcular(reqBody,db);
        break;
      default:
        response
          ..statusCode = HttpStatus.notFound
          ..write('Not Found');
        await response.close();
    }

  });

}
