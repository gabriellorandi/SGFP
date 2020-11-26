import 'package:SGFP/src/folhaPagamento/folhaPagamentoModel.dart';
import 'package:SGFP/src/folhaPagamento/folhaPagamentoService.dart';
import 'package:SGFP/src/util/ErrorHandler.dart';
import 'package:http_server/http_server.dart';


class FolhaPagamentoController  {

  FolhaPagamentoService folhaPagamentoService;

  FolhaPagamento folhaPagamento = FolhaPagamento();

  HttpRequestBody _reqBody;

  FolhaPagamentoController(this._reqBody,db) {
    folhaPagamentoService = new FolhaPagamentoService(db);
  }

  Future handleCalcular() async {
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

  Future handle() async {
    switch (this._reqBody.request.method) {
      case 'GET':
        String idFuncionario = _reqBody.request.uri.queryParameters['idFuncionario'];

        if(idFuncionario == null || idFuncionario.isEmpty ) {
          ErrorHandler.onError("idFuncionario inválido.",_reqBody);
          throw FormatException("idFuncionario inválido.");
        }

        folhaPagamento = await folhaPagamentoService.getFolhaPagamento(idFuncionario)
            .catchError(ErrorHandler.onError((e) => e,_reqBody))
            .whenComplete(() => close(_reqBody));
        _reqBody.request.response.write(folhaPagamento);
        break;
      case 'POST':
        String idFuncionario = _reqBody.request.uri.queryParameters['idFuncionario'];

        if(idFuncionario == null || idFuncionario.isEmpty ) {
            ErrorHandler.onError("idFuncionario inválido.",_reqBody);
            throw FormatException("idFuncionario inválido.");
        }

        folhaPagamento = await folhaPagamentoService.updateFolhaPagamento( _reqBody.body, idFuncionario  )
            .catchError(ErrorHandler.onError((e) => e,_reqBody))
            .whenComplete(() => close(_reqBody));
        _reqBody.request.response.write(folhaPagamento);
        break;
      case 'PATCH':
        String idFuncionario = _reqBody.request.uri.queryParameters['idFuncionario'];

        if(idFuncionario == null || idFuncionario.isEmpty ) {
          ErrorHandler.onError("idFuncionario inválido.",_reqBody);
          throw FormatException("idFuncionario inválido.");
        }

        folhaPagamento = await folhaPagamentoService.updateFolhaPagamento( _reqBody.body, idFuncionario  )
            .catchError(ErrorHandler.onError((e) => e,_reqBody))
            .whenComplete(() => close(_reqBody));
        _reqBody.request.response.write(folhaPagamento);
        break;
      case 'DELETE':
        String idFuncionario = _reqBody.request.uri.queryParameters['idFuncionario'];

        if(idFuncionario == null || idFuncionario.isEmpty ) {
          ErrorHandler.onError("idFuncionario inválido.",_reqBody);
          throw FormatException("idFuncionario inválido.");
        }

        folhaPagamento = await folhaPagamentoService.deleteFolhaPagamento( idFuncionario )
            .catchError(ErrorHandler.onError((e) => e,_reqBody))
            .whenComplete(() => close(_reqBody));
        _reqBody.request.response.write(folhaPagamento);
        break;
      default:
        _reqBody.request.response.statusCode = 405;
    }

    await _reqBody.request.response.close();
  }

  close(_reqBody) async {
    await _reqBody.request.response.close();
  }
}