
class CadastroProdutos {
  Map<String, double> produtos = {};

  void adicionarProduto(String nome, double preco) {
    produtos[nome] = preco;
  }

  String? produtoMaisCaro() {
    if (produtos.isEmpty) return null;
    String nomeMaisCaro = produtos.keys.first;
    produtos.forEach((nome, preco) {
      if (preco > produtos[nomeMaisCaro]!) nomeMaisCaro = nome;
    });
    return nomeMaisCaro;
  }

  String? produtoMaisBarato() {
    if (produtos.isEmpty) return null;
    String nomeMaisBarato = produtos.keys.first;
    produtos.forEach((nome, preco) {
      if (preco < produtos[nomeMaisBarato]!) nomeMaisBarato = nome;
    });
    return nomeMaisBarato;
  }

  double valorMedio() {
    if (produtos.isEmpty) return 0;
    double soma = 0;
    for (double preco in produtos.values) {
      soma += preco;
    }
    return soma / produtos.length;
  }
}

void main() {
  CadastroProdutos cadastro = CadastroProdutos();
  cadastro.adicionarProduto('Mouse', 80.0);
  cadastro.adicionarProduto('Teclado', 150.0);
  cadastro.adicionarProduto('Monitor', 900.0);
  cadastro.adicionarProduto('Cabo HDMI', 25.0);

  print('Produtos: ${cadastro.produtos}');
  print('Mais caro: ${cadastro.produtoMaisCaro()}');     // Monitor
  print('Mais barato: ${cadastro.produtoMaisBarato()}'); // Cabo HDMI
  print('Valor médio: R\$ ${cadastro.valorMedio().toStringAsFixed(2)}'); // 288.75
}
