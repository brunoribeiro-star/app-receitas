import 'package:flutter/material.dart';
import '../models/receita.dart';
import '../repositories/receita_repository.dart';
import 'receitas_detalhes_page.dart';

class ReceitasPage extends StatelessWidget {
  const ReceitasPage({super.key});

  void mostrarDetalhes(BuildContext context, Receita receita) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ReceitasDetalhesPage(receita: receita),
        ),
     );
  }

  @override
  Widget build(BuildContext context) {
    final tabela = RecipeRepository.tabela;

    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Receitas', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              leading: SizedBox(
                  child: Image.asset(tabela[index].foto),
                width: 50,
              ),
              title: Text(tabela[index].nome, style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(tabela[index].descricao),
              onTap: () => mostrarDetalhes(context, tabela[index]),
            );
          },
          padding: EdgeInsets.all(16),
          separatorBuilder: (_, ___) => const Divider(),
          itemCount: tabela.length,)
    );
  }
}
