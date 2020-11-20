import 'package:SGFP/src/folhaPagamento/folhaPagamentoModel.dart';
import 'package:SGFP/src/folhaPagamento/folhaPagamentoService.dart';
import 'package:http_server/http_server.dart';


class FolhaPagamentoController  {

  FolhaPagamentoService folhaPagamentoService;

  FolhaPagamento folhaPagamento = FolhaPagamento();

  HttpRequestBody _reqBody;

  FolhaPagamentoController(this._reqBody,db){
    folhaPagamentoService = new FolhaPagamentoService(db);
    handle();
  }

  FolhaPagamentoController.calcular(this._reqBody,db){
    folhaPagamentoService = new FolhaPagamentoService(db);
    handleCalcular();
  }

  handleCalcular() async {
    switch (this._reqBody.request.method) {
      case 'GET':
        String idFuncionario = _reqBody.request.uri.queryParameters['idFuncionario'];
        folhaPagamento = await folhaPagamentoService.calcularFolhaPagamento(idFuncionario);
        _reqBody.request.response.write(folhaPagamento);
        break;
      default:
        _reqBody.request.response.statusCode = 405;
    }

    await _reqBody.request.response.close();
  }

  handle() async {
    switch (this._reqBody.request.method) {
      case 'GET':
        String idFuncionario = _reqBody.request.uri.queryParameters['idFuncionario'];
        folhaPagamento = await folhaPagamentoService.getFolhaPagamento(idFuncionario);
        _reqBody.request.response.write(folhaPagamento);
        break;
      case 'POST':
        String idFuncionario = _reqBody.request.uri.queryParameters['idFuncionario'];
        folhaPagamento = await folhaPagamentoService.updateFolhaPagamento( _reqBody.body, idFuncionario  );
        _reqBody.request.response.write(folhaPagamento);
        break;
      case 'PATCH':
        String idFuncionario = _reqBody.request.uri.queryParameters['idFuncionario'];
        folhaPagamento = await folhaPagamentoService.updateFolhaPagamento( _reqBody.body, idFuncionario  );
        _reqBody.request.response.write(folhaPagamento);
        break;
      case 'DELETE':
        String idFuncionario = _reqBody.request.uri.queryParameters['idFuncionario'];
        folhaPagamento = await folhaPagamentoService.deleteFolhaPagamento( idFuncionario );
        _reqBody.request.response.write(folhaPagamento);
        break;
      default:
        _reqBody.request.response.statusCode = 405;
    }

    await _reqBody.request.response.close();
  }


}