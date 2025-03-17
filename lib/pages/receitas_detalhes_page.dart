import 'package:flutter/material.dart';
import '../models/receita.dart';

class ReceitasDetalhesPage extends StatelessWidget {
  final Receita receita;

  const ReceitasDetalhesPage({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receita.nome),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(receita.foto, width: 200),
              ),
              const SizedBox(height: 20),
              Text(
                receita.nome,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                receita.descricao,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Text(
                receita.detalhes,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
      ),
    );
  }
}

