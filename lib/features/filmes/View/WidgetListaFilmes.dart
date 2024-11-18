import 'package:flutter/cupertino.dart';

import '../Model/FilmeModel.dart';
import 'card_filme.dart';

class ListaFilmes extends StatelessWidget{

  final List<FilmeModel> filmes;

  const ListaFilmes({Key? key, required this.filmes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 4,
        ),
        itemCount: filmes.length,
        itemBuilder: ((context, index){
          final filme = filmes[index];
          return CardFilme(
    nome: filme.nome,
    imagem: filme.linkImagem,
    );
    }),
    );
  }

}