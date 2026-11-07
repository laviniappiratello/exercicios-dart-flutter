
class Estoque {
  Map<String, int> produtos = {};

  void adicionarProduto(String nome, int quantidade) {
    if (quantidade < 0) {
      print('Quantidade inválida.');
      return;
    }
    produtos[nome] = (produtos[nome] ?? 0) + quantidade;
  }

  void removerQuantidade(String nome, int quantidade) {
    if (!produtos.containsKey(nome)) {
      print('Produto "$nome" não encontrado.');
      return;
    }
    int atual = produtos[nome]!;
    if (quantidade > atual) {
      print('Estoque insuficiente de "$nome" (disponível: $atual).');
      return;
    }
    produtos[nome] = atual - quantidade;
  }

  int consultarEstoque(String nome) {
    return produtos[nome] ?? 0;
  }

  List<String> produtosSemEstoque() {
    List<String> lista = [];
    produtos.forEach((nome, qtd) {
      if (qtd == 0) lista.add(nome);
    });
    return lista;
  }
}

void main() {
  Estoque estoque = Estoque();
  estoque.adicionarProduto('Caneta', 10);
  estoque.adicionarProduto('Caderno', 5);
  estoque.adicionarProduto('Borracha', 3);

  estoque.removerQuantidade('Borracha', 3);
  estoque.removerQuantidade('Caderno', 2);
  estoque.removerQuantidade('Caneta', 50); 
  estoque.removerQuantidade('Lápis', 1);   

  print('Estoque de Caderno: ${estoque.consultarEstoque('Caderno')}'); // 3
  print('Estoque completo: ${estoque.produtos}');
  print('Sem estoque: ${estoque.produtosSemEstoque()}'); // [Borracha]
}
