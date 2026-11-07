import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MediaPage(),
    );
  }
}

class MediaPage extends StatefulWidget {
  const MediaPage({super.key});

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  final _nota1 = TextEditingController();
  final _nota2 = TextEditingController();
  final _nota3 = TextEditingController();
  String _resultado = '';

  double? _ler(TextEditingController c) =>
      double.tryParse(c.text.replaceAll(',', '.'));

  void _calcular() {
    final n1 = _ler(_nota1);
    final n2 = _ler(_nota2);
    final n3 = _ler(_nota3);

    setState(() {
      if (n1 == null || n2 == null || n3 == null) {
        _resultado = 'Preencha as três notas corretamente.';
      } else {
        final media = (n1 + n2 + n3) / 3;
        _resultado = 'Média: ${media.toStringAsFixed(2)}';
      }
    });
  }

  Widget _campo(TextEditingController c, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: c,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nota1.dispose();
    _nota2.dispose();
    _nota3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Média Aritmética')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _campo(_nota1, 'Nota 1'),
            _campo(_nota2, 'Nota 2'),
            _campo(_nota3, 'Nota 3'),
            ElevatedButton(onPressed: _calcular, child: const Text('Calcular')),
            const SizedBox(height: 24),
            Text(_resultado, style: const TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
