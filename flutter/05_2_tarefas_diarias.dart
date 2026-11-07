
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TarefasPage(),
    );
  }
}

enum Prioridade { baixa, media, alta }

extension PrioridadeInfo on Prioridade {
  String get rotulo {
    switch (this) {
      case Prioridade.baixa:
        return 'Baixa';
      case Prioridade.media:
        return 'Média';
      case Prioridade.alta:
        return 'Alta';
    }
  }

  Color get cor {
    switch (this) {
      case Prioridade.baixa:
        return Colors.green;
      case Prioridade.media:
        return Colors.orange;
      case Prioridade.alta:
        return Colors.red;
    }
  }
}

class Tarefa {
  String nome;
  String descricao;
  Prioridade prioridade;
  bool concluida;

  Tarefa(this.nome, this.descricao, this.prioridade, {this.concluida = false});
}

class TarefasPage extends StatefulWidget {
  const TarefasPage({super.key});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  Prioridade _prioridadeSelecionada = Prioridade.media;
  final List<Tarefa> _tarefas = [];

  void _adicionarTarefa() {
    final nome = _nomeController.text.trim();
    if (nome.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Informe o nome da tarefa.')),
      );
      return;
    }
    setState(() {
      _tarefas.add(Tarefa(
        nome,
        _descricaoController.text.trim(),
        _prioridadeSelecionada,
      ));
      _nomeController.clear();
      _descricaoController.clear();
      _prioridadeSelecionada = Prioridade.media;
    });
  }

  void _removerTarefa(int index) {
    setState(() {
      _tarefas.removeAt(index);
    });
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tarefas Diárias')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome da tarefa',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(
                labelText: 'Breve descrição',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const Text('Prioridade:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: Prioridade.values.map((p) {
                return Expanded(
                  child: RadioListTile<Prioridade>(
                    contentPadding: EdgeInsets.zero,
                    title: Text(p.rotulo),
                    value: p,
                    groupValue: _prioridadeSelecionada,
                    onChanged: (valor) {
                      setState(() {
                        _prioridadeSelecionada = valor!;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
            Center(
              child: ElevatedButton(
                onPressed: _adicionarTarefa,
                child: const Text('Adicionar tarefa'),
              ),
            ),
            const Divider(height: 24),
            Expanded(
              child: _tarefas.isEmpty
                  ? const Center(child: Text('Nenhuma tarefa cadastrada.'))
                  : ListView.builder(
                      itemCount: _tarefas.length,
                      itemBuilder: (context, index) {
                        final t = _tarefas[index];
                        return Card(
                          child: ListTile(
                            leading: Checkbox(
                              value: t.concluida,
                              onChanged: (valor) {
                                setState(() {
                                  t.concluida = valor ?? false;
                                });
                              },
                            ),
                            title: Text(
                              t.nome,
                              style: TextStyle(
                                decoration: t.concluida
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (t.descricao.isNotEmpty) Text(t.descricao),
                                Text(
                                  'Prioridade: ${t.prioridade.rotulo}',
                                  style: TextStyle(
                                    color: t.prioridade.cor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _removerTarefa(index),
                            ),
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
