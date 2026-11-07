import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListaComprasPage(),
    );
  }
}

class ItemCompra {
  String nome;
  bool comprado;

  ItemCompra(this.nome, {this.comprado = false});
}

class ListaComprasPage extends StatefulWidget {
  const ListaComprasPage({super.key});

  @override
  State<ListaComprasPage> createState() => _ListaComprasPageState();
}

class _ListaComprasPageState extends State<ListaComprasPage> {
  final TextEditingController _itemController = TextEditingController();
  final List<ItemCompra> _itens = [];

  void _adicionarItem() {
    final nome = _itemController.text.trim();
    if (nome.isEmpty) return;
    setState(() {
      _itens.add(ItemCompra(nome));
      _itemController.clear();
    });
  }

  void _removerItem(int index) {
    setState(() {
      _itens.removeAt(index);
    });
  }

  @override
  void dispose() {
    _itemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Compras')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _itemController,
                    decoration: const InputDecoration(
                      labelText: 'Novo item',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _adicionarItem(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _adicionarItem,
                  child: const Text('Adicionar'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _itens.isEmpty
                  ? const Center(child: Text('Nenhum item na lista.'))
                  : ListView.builder(
                      itemCount: _itens.length,
                      itemBuilder: (context, index) {
                        final item = _itens[index];
                        return ListTile(
                          leading: Checkbox(
                            value: item.comprado,
                            onChanged: (valor) {
                              setState(() {
                                item.comprado = valor ?? false;
                              });
                            },
                          ),
                          title: Text(
                            item.nome,
                            style: TextStyle(
                              decoration: item.comprado
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              color: item.comprado ? Colors.grey : null,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _removerItem(index),
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
