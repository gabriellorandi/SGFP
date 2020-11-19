import 'package:SGFP/src/folhaPagamento/folhaPagamentoModel.dart';

class Funcionario {

  int id, cpf;

  String nome, cargo;

  double rg, salario, extra;

  FolhaPagamento folhaPagamento;

  Funcionario();

  Funcionario.copia(Funcionario f) {
    this.id = f.id;
    this.nome = f.nome;
    this.cargo = f.cargo;
    this.rg = f.rg;
    this.cpf = f.cpf;
    this.salario = f.salario;
    this.extra = f.extra;
  }

  Funcionario.build(this.id,this.nome,this.cargo,this.rg,this.cpf,this.salario, this.extra);

  factory Funcionario.fromJson(var json){
    return Funcionario.build(
        json['id'] as int,
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
    return 'Nome: $nome - cpf: $cpf';
  }
}