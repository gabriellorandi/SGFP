import 'package:SGFP/src/folhaPagamento/folhaPagamentoModel.dart';
import 'package:SGFP/src/folhaPagamento/folhaPagamentoService.dart';
import 'package:http_server/http_server.dart';


class FolhaPagamentoController  {

  final FolhaPagamentoService folhaPagamentoService = new FolhaPagamentoService();

  FolhaPagamento folhaPagamento = FolhaPagamento();

  HttpRequestBody _reqBody;

  FolhaPagamentoController(this._reqBody){
    handle();
  }

  handle() async {
    switch (this._reqBody.request.method) {
      case 'GET':
        var idFuncionario = int.parse(_reqBody.request.uri.queryParameters['idFuncionario']);
        folhaPagamento = await folhaPagamentoService.getFolhaPagamento(idFuncionario);
        _reqBody.request.response.write(folhaPagamento);
        break;
      case 'POST':
        var idFuncionario = int.parse(_reqBody.request.uri.queryParameters['idFuncionario']);
        folhaPagamento = await folhaPagamentoService.addFolhaPagamento( _reqBody.body, idFuncionario  );
        _reqBody.request.response.write(folhaPagamento);
        break;
      case 'PATCH':
        var id = int.parse(_reqBody.request.uri.queryParameters['id']);
        folhaPagamento = await folhaPagamentoService.updateFolhaPagamento( _reqBody.body, id  );
        _reqBody.request.response.write(folhaPagamento);
        break;
      case 'DELETE':
        var id = int.parse(_reqBody.request.uri.queryParameters['id']);
        folhaPagamento = await folhaPagamentoService.deleteFolhaPagamento( id );
        _reqBody.request.response.write(folhaPagamento);
        break;
      default:
        _reqBody.request.response.statusCode = 405;
    }

    await _reqBody.request.response.close();
  }


}