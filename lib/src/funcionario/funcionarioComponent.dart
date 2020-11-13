import 'dart:async';
import 'package:angular_forms/angular_forms.dart';

import 'package:SGFP/src/funcionario/funcionarioModel.dart';
import 'package:SGFP/src/funcionario/funcionarioService.dart';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import '../folhaPagamento/folhaPagamentoComponent.dart';

@Component(
  selector: 'funcionario',
  styleUrls: ['funcionarioStyle.css'],
  templateUrl: 'funcionarioView.html',
  directives: [
    FolhaPagamentoComponent,
    formDirectives,
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    coreDirectives,
    NgFor,
    NgIf,
  ],
  providers: [ClassProvider(FuncionarioService)],
)
class FuncionarioComponent implements OnInit {
  final FuncionarioService funcionarioService;

  List<Funcionario> funcionarios = [];
  Funcionario funcionario = Funcionario();

  bool folhaPagamentoDisplay = false;
  bool funcionarioDisplay = false;
  int id = 1;
  int controleIndex = null;

  FuncionarioComponent(this.funcionarioService);

  @override
  Future<Null> ngOnInit() async {
    funcionarios = await funcionarioService.getFuncioncariosList();
  }

  void onSubmit() {

    if(controleIndex == null) {
      funcionario.id = id++;
      funcionarios.add(funcionario);

    } else {
      funcionarios.removeAt(controleIndex);
      funcionarios.insert(controleIndex, funcionario);
      controleIndex = null;
    }

    funcionario = Funcionario();
    funcionarioDisplay = false;
  }

  void remove(int index) => funcionarios.removeAt(index);

  void edit(int index) {
    funcionarioDisplay = true;
    controleIndex = index;
    funcionario = Funcionario.copia(funcionarios.elementAt(index));
  }

  void calcular(int index) {
    folhaPagamentoDisplay = true;
  }

  void clear() {
    funcionario.nome = '';
    funcionario.cargo = '';
    funcionario.cpf = null;
    funcionario.rg = null;
    funcionario.salario = null;
  }

  void adicionarFuncionario() {
    funcionarioDisplay = true;
    folhaPagamentoDisplay = false;
  }

}
