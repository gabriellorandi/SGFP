import 'package:SGFP/src/folhaPagamento/folhaPagamentoModel.dart';
import 'package:SGFP/src/folhaPagamento/folhaPagamentoService.dart';


class FolhaPagamentoController  {

  final FolhaPagamentoService folhaPagamentoService;

  FolhaPagamento folhaPagamento = FolhaPagamento();

  FolhaPagamentoController(this.folhaPagamentoService);



}