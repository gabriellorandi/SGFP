import 'dart:async';
import 'package:SGFP/src/folhaPagamento/folhaPagamentoModel.dart';
import 'package:angular/core.dart';
import 'package:SGFP/src/folhaPagamento/folhaPagamentoService.dart';
import 'package:angular/angular.dart';

@Component(
  selector: 'folhaPagamento',
  styleUrls: ['folhaPagamentoStyle.css'],
  templateUrl: 'folhaPagamentoView.html',
  directives: [

  ],
  providers: [ClassProvider(FolhaPagamentoService)],
)
class FolhaPagamentoComponent implements OnInit {

  final FolhaPagamentoService folhaPagamentoService;

  FolhaPagamento folhaPagamento = FolhaPagamento();

  FolhaPagamentoComponent(this.folhaPagamentoService);

  @override
  Future<Null> ngOnInit() async {

  }

  void onSubmit(){

  }

  void cancelar(){

  }

  void clear() {
    folhaPagamento.faltas = null;
    folhaPagamento.horasExtras = null;
    folhaPagamento.diasTrabalhados = null;
  }

}