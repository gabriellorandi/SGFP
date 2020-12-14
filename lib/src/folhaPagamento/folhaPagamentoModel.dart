class FolhaPagamento {

  int workedDays, overtime, absence;

  FolhaPagamento();

  FolhaPagamento.build(this.workedDays,this.overtime,this.absence);

  factory FolhaPagamento.fromJson(var json){
    if(json['folhaPagamento'] == null) return null;

    var folha = json['folhaPagamento'];

    return FolhaPagamento.build(
      folha['workedDays'] as int,
      folha['overtime'] as int,
      folha['absence'] as int
    );
  }

  @override
  String toString() {
    return 'FolhaPagamento{workedDays: $workedDays, overtime: $overtime, absence: $absence}';
  }

  Map<String, dynamic> toJson() {
    return {
      'workedDays': this.workedDays,
      'overtime': this.overtime,
      'absence': this.absence
    };
  }

}