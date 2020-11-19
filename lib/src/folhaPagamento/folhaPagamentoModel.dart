class FolhaPagamento {

  int diasTrabalhados, horasExtras, faltas;

  FolhaPagamento();

  FolhaPagamento.build(this.diasTrabalhados,this.horasExtras,this.faltas);

  factory FolhaPagamento.fromJson(var json){
    return FolhaPagamento.build(
      json['diasTrabalhados'] as int,
      json['horasExtras'] as int,
      json['faltas'] as int
    );
  }

  @override
  String toString() {
    return 'FolhaPagamento{diasTrabalhados: $diasTrabalhados, horasExtras: $horasExtras, faltas: $faltas}';
  }
}