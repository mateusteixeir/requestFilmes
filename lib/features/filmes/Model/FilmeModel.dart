class FilmeModel{

  String nome;
  String linkImagem;

  FilmeModel({required this.nome, required this.linkImagem});

  factory FilmeModel.fromJson(Map<String, dynamic> json) {
    return FilmeModel(
      nome: json['nome'],
      linkImagem: json['imagem'],
    );
  }

}