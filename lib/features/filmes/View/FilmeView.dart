import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:request_films_project/features/filmes/Model/FilmeModel.dart';

import '../Service/FilmesService.dart';

class FilmeView extends StatefulWidget {
  const FilmeView({Key? key}) : super(key: key);

  @override
  State<FilmeView> createState() {
    return _FilmeViewState();
  }
}

class _FilmeViewState extends State<FilmeView> {
  Future<List<FilmeModel>>? futureFilmes;

  @override
  void initState() {
    futureFilmes = FilmesService().obterFilmes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Filmes',
      body: FutureBuilder(future: futureFilmes, builder: (contex, snapshot){
        if(snapshot.hasData){
          final filmes = snapshot.data as List<FilmeModel>;
          return ListaFilmes(filmes: filmes);

        }else{
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }
      }),
    );
  }
}
