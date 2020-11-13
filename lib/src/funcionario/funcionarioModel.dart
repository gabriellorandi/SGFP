import 'package:SGFP/src/folhaPagamento/folhaPagamentoModel.dart';

class Funcionario {

  int id;

  String nome, cargo;

  double rg, cpf, salario, extra;

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

  @override
  String toString() {
    return 'Nome: $nome - cpf: $cpf';
  }
}