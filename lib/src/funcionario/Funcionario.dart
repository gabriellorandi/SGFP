import 'package:SGFP/src/folhaPagamento/folhaPagamentoModel.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Funcionario {

  ObjectId _id;

  String name,rg, cpf, position;

  double  salary, overtimeValue;

  FolhaPagamento folhaPagamento;

  Funcionario();

  Funcionario.copia(Funcionario f) {
    this._id = f._id;
    this.name = f.name;
    this.position = f.position;
    this.rg = f.rg;
    this.cpf = f.cpf;
    this.salary = f.salary;
    this.overtimeValue = f.overtimeValue;
  }

  Funcionario.build(this._id,this.name,this.position,this.rg,this.cpf,this.salary, this.overtimeValue);

  factory Funcionario.fromJson(var json){
    return Funcionario.build(
        json['_id'] as ObjectId,
        json['name'] as String,
        json['position'] as String,
        json['rg'] as String,
        json['cpf'] as String,
        (json['salary'] as num).toDouble(),
        (json['overtimeValue'] as num).toDouble()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this._id,
      'name': this.name,
      'position': this.position,
      'rg': this.rg,
      'cpf': this.cpf,
      'salary': this.salary,
      'overtimeValue': this.overtimeValue,
    };
  }

  @override
  String toString() {
    return 'Employee{id: $_id, cpf: $cpf, nome: $name, cargo: $position, rg: $rg, salario: $salary, extra: $overtimeValue}';
  }
}