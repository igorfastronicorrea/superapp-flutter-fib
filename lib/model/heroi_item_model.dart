class HeroiItemModel {
  String id = "";
  String nome = "";
  String imagem = "";

  HeroiItemModel({required this.id, required this.nome, required this.imagem});

  factory HeroiItemModel.fromJson(Map<String, dynamic> json) {
    return HeroiItemModel(
      id: json['id'] as String,
      nome: json['nome'] as String,
      imagem: json['imagem'] as String,
    );
  }
}
