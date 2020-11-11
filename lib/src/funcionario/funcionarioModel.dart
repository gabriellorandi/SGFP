class Funcionario {

  String nome, cargo;

  double rg, cpf, salario, extra;

  Funcionario();

  Funcionario.build(this.nome,this.cargo,this.rg,this.cpf,this.salario, this.extra);

  @override
  String toString() {
    return 'Nome: $nome - cpf: $cpf';
  }
}