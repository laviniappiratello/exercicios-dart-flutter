
class ProdutoPares {
  int calcular(int n) {
    int produto = 1;
    for (int i = 2; i <= n; i += 2) {
      produto *= i;
    }
    return produto;
  }
}

void main() {
  ProdutoPares p = ProdutoPares();
  print('Produto dos pares até 10: ${p.calcular(10)}'); 
  print('Produto dos pares até 7: ${p.calcular(7)}');  
}
