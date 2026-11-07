
class Numeros {
  List<int> numeros;

  Numeros(this.numeros) {
    if (numeros.length != 10) {
      throw ArgumentError('A lista deve conter exatamente 10 números.');
    }
  }

  int maior() {
    int maior = numeros[0];
    for (int n in numeros) {
      if (n > maior) maior = n;
    }
    return maior;
  }

  int menor() {
    int menor = numeros[0];
    for (int n in numeros) {
      if (n < menor) menor = n;
    }
    return menor;
  }

  double media() {
    int soma = 0;
    for (int n in numeros) {
      soma += n;
    }
    return soma / numeros.length;
  }
}

void main() {
  Numeros nums = Numeros([12, 5, 33, 8, 21, 2, 17, 40, 9, 13]);
  print('Números: ${nums.numeros}');
  print('Maior: ${nums.maior()}');   
  print('Menor: ${nums.menor()}');   
  print('Média: ${nums.media()}');  
}
