
class ContadorPalavras {
  List<String> palavras;

  ContadorPalavras(this.palavras);

  Map<String, int> contar() {
    Map<String, int> contagem = {};
    for (String p in palavras) {
      String palavra = p.toLowerCase(); 
      contagem[palavra] = (contagem[palavra] ?? 0) + 1;
    }
    return contagem;
  }
}

void main() {
  ContadorPalavras c = ContadorPalavras(
    ['dart', 'flutter', 'Dart', 'java', 'flutter', 'dart'],
  );
  print('Palavras: ${c.palavras}');
  print('Contagem: ${c.contar()}'); // {dart: 3, flutter: 2, java: 1}
}
