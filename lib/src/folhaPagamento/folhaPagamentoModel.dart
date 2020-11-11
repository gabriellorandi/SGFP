class FolhaPagamento {

  int diasTrabalhados, horasExtras, faltas;

  FolhaPagamento();

  FolhaPagamento.build(this.diasTrabalhados,this.horasExtras,this.faltas);

  @override
  String toString() {
    return 'Dias trabalhados: $diasTrabalhados - Horas Extras: $horasExtras - Faltas: $faltas';
  }
}