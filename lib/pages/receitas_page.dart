import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/receita.dart';
import '../repositories/receita_repository.dart';
import 'receitas_detalhes_page.dart';

class ReceitasPage extends StatefulWidget {
  const ReceitasPage({super.key});

  @override
  State<ReceitasPage> createState() => _ReceitasPageState();
}

class _ReceitasPageState extends State<ReceitasPage> {
  List<Receita> receitas = List.from(RecipeRepository.tabela);
  Receita? deletedReceita;
  int? deletedReceitaPos;

  void mostrarDetalhes(BuildContext context, Receita receita) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReceitasDetalhesPage(receita: receita)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Minhas Receitas',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Slidable(
            startActionPane: ActionPane(
              motion: const DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) => _deleteReceita(index),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Excluir',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) => _editReceita(index),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Editar',
                ),
              ],
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              leading: SizedBox(
                child: Image.asset(receitas[index].foto),
                width: 50,
              ),
              title: Text(
                receitas[index].nome,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(receitas[index].descricao),
              onTap: () => mostrarDetalhes(context, receitas[index]),
            ),
          );
        },
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: receitas.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarReceita,
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _deleteReceita(int index) {
    setState(() {
      deletedReceita = receitas[index];
      deletedReceitaPos = index;
      receitas.removeAt(index);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Receita "${deletedReceita!.nome}" foi removida com sucesso!',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: Colors.yellow,
          onPressed: () {
            setState(() {
              receitas.insert(deletedReceitaPos!, deletedReceita!);
            });
          },
        ),
      ),
    );
  }

  void _editReceita(int index) {
    TextEditingController controller = TextEditingController(text: receitas[index].nome);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Editar Receita'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Nome da Receita'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                receitas[index].nome = controller.text;
              });
              Navigator.of(context).pop();
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  void _adicionarReceita() {
    TextEditingController nomeController = TextEditingController();
    TextEditingController descricaoController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Adicionar Receita'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome da Receita'),
            ),
            TextField(
              controller: descricaoController,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await _mostrarCarregamento();
              setState(() {
                receitas.add(Receita(
                  foto: 'assets/default.png',
                  nome: nomeController.text,
                  descricao: descricaoController.text,
                  detalhes: '',
                ));
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Receita adicionada com sucesso!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
  }

  Future<void> _mostrarCarregamento() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text('Adicionando receita...'),
          ],
        ),
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
  }
}
