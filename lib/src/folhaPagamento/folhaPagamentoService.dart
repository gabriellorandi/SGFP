import 'package:SGFP/src/folhaPagamento/folhaPagamentoModel.dart';
import 'package:mongo_dart/mongo_dart.dart';

class FolhaPagamentoService {

  DbCollection funcionarioDB;

  FolhaPagamentoService(db) {
    funcionarioDB = db.collection('funcionario');
  }

  Future<FolhaPagamento> getFolhaPagamento(String idFuncionario) async {
    var funcionario = await funcionarioDB.findOne(where.id(ObjectId.parse(idFuncionario)) );
     return FolhaPagamento.fromJson( funcionario['folhaPagamento'] );
  }

  Future<FolhaPagamento> updateFolhaPagamento(body, String idFuncionario) async {
    var funcionario = await funcionarioDB
        .update(where.id(ObjectId.parse(idFuncionario)),modify.set('folhaPagamento', body));
    return FolhaPagamento.fromJson(funcionario['folhaPagamento'] );

  }

  Future<FolhaPagamento> deleteFolhaPagamento(String idFuncionario) async {
    var funcionario = await funcionarioDB
        .update(where.id(ObjectId.parse(idFuncionario)),modify.set('folhaPagamento', null));
    return FolhaPagamento.fromJson(funcionario['folhaPagamento']);
  }

  calcularFolhaPagamento(String idFuncionario) {

  }

}
