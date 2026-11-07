
class Funcionario {
  String nome;
  double salario;

  Funcionario(this.nome, this.salario);

  void reajustarSalario() {
    salario = salario * 1.25; 
  }
}

void main() {
  Funcionario f = Funcionario('Ana', 2000.0);

  print('Funcionário: ${f.nome}');
  print('Salário atual: R\$ ${f.salario.toStringAsFixed(2)}');

  f.reajustarSalario();

  print('Salário reajustado: R\$ ${f.salario.toStringAsFixed(2)}');
}
