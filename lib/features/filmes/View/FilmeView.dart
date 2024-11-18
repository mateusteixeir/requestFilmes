import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:request_films_project/features/filmes/Model/FilmeModel.dart';

import '../Service/FilmesService.dart';
import 'WidgetListaFilmes.dart';

void main() {
  runApp(FilmeView());
}



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
      title: "Request Filmes",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Request Filmes'),
          centerTitle: true,
        ),
        body: FutureBuilder(future: futureFilmes, builder: (context, snapshot){
          if(snapshot.hasData){
            final filmes = snapshot.data as List<FilmeModel>;
            return ListaFilmes(filmes: filmes);
          }else if(snapshot.hasError){
           return Center(child: Text(snapshot.error.toString()));
          }
          return Center(
            child: CircularProgressIndicator(),
          );

        },
        ),

      ),
    );
  }
}
