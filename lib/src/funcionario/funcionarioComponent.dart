import 'dart:async';
import 'package:angular_forms/angular_forms.dart';

import 'package:SGFP/src/funcionario/funcionarioModel.dart';
import 'package:SGFP/src/funcionario/funcionarioService.dart';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: 'funcionario',
  styleUrls: ['funcionarioStyle.css'],
  templateUrl: 'funcionarioView.html',
  directives: [
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

  FuncionarioComponent(this.funcionarioService);

  @override
  Future<Null> ngOnInit() async {
    funcionarios = await funcionarioService.getFuncioncarioList();
  }

  void onSubmit() {
    funcionarios.add(funcionario);
    funcionario = Funcionario();
  }

  void remove(int index) => funcionarios.removeAt(index);

  void edit(int index) {

  }

  void clear() {
    funcionario.nome = '';
    funcionario.cargo = '';
    funcionario.cpf = 0;
    funcionario.rg = 0;
    funcionario.salario = 0;
  }

}
