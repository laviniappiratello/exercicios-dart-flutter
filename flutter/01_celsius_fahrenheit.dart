import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConversorPage(),
    );
  }
}

class ConversorPage extends StatefulWidget {
  const ConversorPage({super.key});

  @override
  State<ConversorPage> createState() => _ConversorPageState();
}

class _ConversorPageState extends State<ConversorPage> {
  final TextEditingController _celsiusController = TextEditingController();
  String _resultado = '';

  void _converter() {
    final double? celsius =
        double.tryParse(_celsiusController.text.replaceAll(',', '.'));

    setState(() {
      if (celsius == null) {
        _resultado = 'Digite um valor válido.';
      } else {
        final double fahrenheit = (celsius * 9 / 5) + 32;
        _resultado =
            '${celsius.toStringAsFixed(1)} °C = ${fahrenheit.toStringAsFixed(1)} °F';
      }
    });
  }

  @override
  void dispose() {
    _celsiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Celsius → Fahrenheit')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _celsiusController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true, signed: true),
              decoration: const InputDecoration(
                labelText: 'Temperatura em °C',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _converter, child: const Text('Converter')),
            const SizedBox(height: 24),
            Text(_resultado, style: const TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
