import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AreaPage(),
    );
  }
}

class AreaPage extends StatefulWidget {
  const AreaPage({super.key});

  @override
  State<AreaPage> createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  final _larguraController = TextEditingController();
  final _alturaController = TextEditingController();
  String _resultado = '';

  void _calcular() {
    final largura =
        double.tryParse(_larguraController.text.replaceAll(',', '.'));
    final altura = double.tryParse(_alturaController.text.replaceAll(',', '.'));

    setState(() {
      if (largura == null || altura == null || largura < 0 || altura < 0) {
        _resultado = 'Digite valores válidos.';
      } else {
        final area = largura * altura;
        _resultado = 'Área: ${area.toStringAsFixed(2)}';
      }
    });
  }

  @override
  void dispose() {
    _larguraController.dispose();
    _alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Área do Retângulo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _larguraController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Largura',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _alturaController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Altura',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _calcular, child: const Text('Calcular')),
            const SizedBox(height: 24),
            Text(_resultado, style: const TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
