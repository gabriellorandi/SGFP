import 'package:SGFP/src/folhaPagamento/folhaPagamentoModel.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Funcionario {

  ObjectId _id;

  int cpf;

  String nome, cargo;

  double rg, salario, extra;

  FolhaPagamento folhaPagamento;

  Funcionario();

  Funcionario.copia(Funcionario f) {
    this._id = f._id;
    this.nome = f.nome;
    this.cargo = f.cargo;
    this.rg = f.rg;
    this.cpf = f.cpf;
    this.salario = f.salario;
    this.extra = f.extra;
  }

  Funcionario.build(this._id,this.nome,this.cargo,this.rg,this.cpf,this.salario, this.extra);

  factory Funcionario.fromJson(var json){
    return Funcionario.build(
        json['_id'] as ObjectId,
        json['nome'] as String,
        json['cargo'] as String,
        json['rg'] as double,
        json['cpf'] as int,
        json['salario'] as double,
        json['extra'] as double,
    );
  }

  @override
  String toString() {
    return 'Funcionario{id: $_id, cpf: $cpf, nome: $nome, cargo: $cargo, rg: $rg, salario: $salario, extra: $extra}';
  }
}