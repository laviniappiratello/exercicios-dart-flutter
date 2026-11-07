
class Numeros {
  List<int> numeros;

  Numeros(this.numeros) {
    if (numeros.length != 5) {
      throw ArgumentError('A lista deve conter exatamente 5 números.');
    }
  }

  int somarPares() {
    int soma = 0;
    for (int n in numeros) {
      if (n % 2 == 0) soma += n;
    }
    return soma;
  }

  int somarImpares() {
    int soma = 0;
    for (int n in numeros) {
      if (n % 2 != 0) soma += n;
    }
    return soma;
  }
}

void main() {
  Numeros nums = Numeros([3, 8, 15, 22, 7]);
  print('Números: ${nums.numeros}');
  print('Soma dos pares: ${nums.somarPares()}');     // 8 + 22 = 30
  print('Soma dos ímpares: ${nums.somarImpares()}'); // 3 + 15 + 7 = 25
}
