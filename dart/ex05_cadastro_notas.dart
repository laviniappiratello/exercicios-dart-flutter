
class CadastroNotas {
  Map<String, double> medias = {};

  void adicionarAluno(String nome, double media) {
    medias[nome] = media;
  }

  List<String> alunosAprovados() {
    List<String> aprovados = [];
    medias.forEach((nome, media) {
      if (media >= 6) aprovados.add(nome);
    });
    return aprovados;
  }
}

void main() {
  CadastroNotas cadastro = CadastroNotas();
  cadastro.adicionarAluno('Ana', 8.5);
  cadastro.adicionarAluno('Bruno', 5.0);
  cadastro.adicionarAluno('Carla', 6.0);
  cadastro.adicionarAluno('Diego', 4.5);

  print('Médias: ${cadastro.medias}');
  print('Aprovados: ${cadastro.alunosAprovados()}'); // [Ana, Carla]
}
