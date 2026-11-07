
class Turma {
  List<String> alunos = [];
  Map<String, double> notas = {};

  void adicionarAluno(String nome, double nota) {
    alunos.add(nome);
    notas[nome] = nota;
  }

  List<String> aprovados() {
    List<String> lista = [];
    for (String aluno in alunos) {
      double nota = notas[aluno] ?? 0;
      if (nota >= 6) lista.add(aluno);
    }
    return lista;
  }
}

void main() {
  Turma turma = Turma();
  turma.adicionarAluno('Ana', 7.0);
  turma.adicionarAluno('Bruno', 4.0);
  turma.adicionarAluno('Carla', 9.5);
  turma.adicionarAluno('Diego', 6.0);

  print('Alunos: ${turma.alunos}');
  print('Notas: ${turma.notas}');
  print('Aprovados: ${turma.aprovados()}'); // [Ana, Carla, Diego]
}
