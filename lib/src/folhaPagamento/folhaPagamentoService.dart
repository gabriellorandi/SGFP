import 'package:SGFP/src/folhaPagamento/folhaPagamentoModel.dart';
import 'package:SGFP/src/funcionario/Funcionario.dart';
import 'package:SGFP/src/funcionario/FuncionarioService.dart';
import 'package:mongo_dart/mongo_dart.dart';

class FolhaPagamentoService {

  DbCollection funcionarioDB;

  FolhaPagamentoService(db) {
    funcionarioDB = db.collection('funcionario');
  }

  Future<FolhaPagamento> getFolhaPagamento(String idFuncionario) async {
    var folhaPagamento = await findById(idFuncionario);

    if(folhaPagamento == null) return null;

     return folhaPagamento ;
  }

  Future<FolhaPagamento> updateFolhaPagamento(body, String idFuncionario) async {

    await funcionarioDB.update(where.id(ObjectId.parse(idFuncionario)),modify.set('folhaPagamento', body));

    var folhaPagamento = await findById(idFuncionario);

    return folhaPagamento;

  }

  Future<FolhaPagamento> deleteFolhaPagamento(String idFuncionario) async {
    await funcionarioDB.update(where.id(ObjectId.parse(idFuncionario)),modify.set('folhaPagamento', null));

    var folhaPagamento = await findById(idFuncionario);

    return folhaPagamento;
  }

  Future<FolhaPagamento>  findById(String id) async {
    return FolhaPagamento.fromJson( await funcionarioDB.findOne(where.id(ObjectId.parse(id))));
  }

  Future<Funcionario>  findFuncionarioById(String id) async {
    return Funcionario.fromJson( await funcionarioDB.findOne(where.id(ObjectId.parse(id)) ) );
  }

  calcularFolhaPagamento(String idFuncionario) async {

    var funcionario = await findFuncionarioById(idFuncionario);

    var folha = await findById(idFuncionario);

    var salarioDia = funcionario.salary /  20;

    return (salarioDia * folha.workedDays) + (funcionario.overtimeValue * folha.overtime ) - (salarioDia * folha.absence);
  }

}
