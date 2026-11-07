import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DescontoPage(),
    );
  }
}

class Produto {
  final String nome;
  final double precoOriginal;
  final double desconto; // em %

  Produto(this.nome, this.precoOriginal, this.desconto);

  double get precoFinal => precoOriginal - (precoOriginal * desconto / 100);
}

class DescontoPage extends StatefulWidget {
  const DescontoPage({super.key});

  @override
  State<DescontoPage> createState() => _DescontoPageState();
}

class _DescontoPageState extends State<DescontoPage> {
  final _nomeController = TextEditingController();
  final _precoController = TextEditingController();
  final _descontoController = TextEditingController();
  final List<Produto> _produtos = [];
  String _mensagem = '';

  void _calcular() {
    final nome = _nomeController.text.trim();
    final preco = double.tryParse(_precoController.text.replaceAll(',', '.'));
    final desconto =
        double.tryParse(_descontoController.text.replaceAll(',', '.'));

    setState(() {
      if (nome.isEmpty || preco == null || desconto == null) {
        _mensagem = 'Preencha todos os campos corretamente.';
        return;
      }
      if (desconto < 0 || desconto > 100) {
        _mensagem = 'O desconto deve estar entre 0 e 100%.';
        return;
      }
      final produto = Produto(nome, preco, desconto);
      _produtos.add(produto);
      _mensagem =
          'Preço final de $nome: R\$ ${produto.precoFinal.toStringAsFixed(2)}';

      _nomeController.clear();
      _precoController.clear();
      _descontoController.clear();
    });
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _precoController.dispose();
    _descontoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de Desconto')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do produto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _precoController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Preço original (R\$)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _descontoController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Desconto (%)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _calcular,
              child: const Text('Calcular e adicionar'),
            ),
            const SizedBox(height: 12),
            Text(_mensagem, style: const TextStyle(fontSize: 18)),
            const Divider(height: 32),
            const Text('Produtos criados',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: _produtos.length,
                itemBuilder: (context, index) {
                  final p = _produtos[index];
                  return ListTile(
                    leading: const Icon(Icons.sell),
                    title: Text(p.nome),
                    subtitle: Text(
                      'De R\$ ${p.precoOriginal.toStringAsFixed(2)} '
                      '(-${p.desconto.toStringAsFixed(0)}%)',
                    ),
                    trailing: Text(
                      'R\$ ${p.precoFinal.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
