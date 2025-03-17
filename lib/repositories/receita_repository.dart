import 'package:app_receitas/models/receita.dart';

class RecipeRepository {
  static List<Receita> tabela = [
    Receita(
        foto: 'images/bolo-cenoura.JPG',
        nome: 'Bolo de Cenoura',
        descricao: 'Veja aqui a receita desse deilicioso bolo:',
        detalhes: 'Ingredientes:\n\n- '
            '3 cenouras médias\n- '
            '3 ovos\n- '
            '1 xícara de óleo\n- '
            '2 xícaras de açúcar\n- '
            '2 xícaras de farinha de trigo\n- '
            '1 colher (sopa) de fermento\n\n- '
            'Modo de preparo:\n\n- '
            'Bata no liquidificador as cenouras, os ovos e o óleo.\n- '
            'Em uma tigela, misture o açúcar e a farinha, e adicione a mistura do liquidificador.\n- '
            'Acrescente o fermento e misture delicadamente.\n- '
            'Despeje em uma forma untada e asse a 180°C por cerca de 40 minutos.\n- '
            'Cubra com brigadeiro ou calda de chocolate.'
    ),
    Receita(
        foto: 'images/torta.jpg',
        nome: 'Torta de Bolacha',
        descricao: 'Veja aqui a receita dessa deiliciosa torta:',
        detalhes: 'Ingredientes:\n\n- '
            '1 pacote de bolacha maisena\n- '
            '1 lata de leite condensado\n- '
            '1 lata de creme de leite\n- '
            '1 colher (sopa) de manteiga\n- '
            '1 xícara de leite\n- '
            '2 colheres (sopa) de chocolate em pó\n\n- '
            'Modo de preparo:\n\n- '
            'Faça um creme cozinhando o leite condensado, a manteiga e o chocolate até engrossar.\n- '
            'Retire do fogo, misture o creme de leite e deixe esfriar.\n- '
            'Molhe as bolachas no leite e faça camadas intercalando com o creme.\n- '
            'Finalize com creme e leve à geladeira por 4 horas.\n- '
            'Decore com raspas de chocolate ou castanhas.'
    ),
    Receita(
        foto: 'images/strogonoff.png',
        nome: 'Strogonoff de Frango',
        descricao: 'Veja aqui a receita desse deilicioso strogonoff:',
        detalhes: 'Ingredientes:\n\n- '
            '250g de peito de frango em cubos\n- '
            '1/2 cebola picada\n- '
            '1 dente de alho picado\n- '
            '1 colher (sopa) de ketchup\n- '
            '1 colher (sopa) de mostarda\n- '
            '1/2 caixinha de creme de leite\n- '
            'Sal e pimenta a gosto\n\n- '
            'Modo de preparo:\n\n- '
            'Refogue a cebola e o alho em um pouco de óleo.\n- '
            'Adicione o frango, tempere com sal e pimenta e cozinhe até dourar.\n- '
            'Acrescente o ketchup e a mostarda, misturando bem.\n- '
            'Desligue o fogo e adicione o creme de leite.\n- '
            'Sirva com arroz e batata palha.'
    ),
  ];
}