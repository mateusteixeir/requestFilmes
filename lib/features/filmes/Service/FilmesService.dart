import 'dart:convert';

import 'package:http/http.dart' as http;


import '../Model/FilmeModel.dart';

class FilmesService {
  final String _url = "https://raw.githubusercontent.com/alura-cursos/obtendo_dados_com_flutter_http/main/filmes.json";


  Future<List<FilmeModel>> obterFilmes() async {
    final response = await http.get(Uri.parse(_url));

    if(response.statusCode == 200){
      final json = jsonDecode(response.body);

      return List<FilmeModel>.from(json.map((elemento){
        return FilmeModel.fromJson(elemento);
      }));

    }else{
     return Future.error("Erro ao obter filmes");
    }
  }

}