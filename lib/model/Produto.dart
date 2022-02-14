class Produto {
  int id;
  String nome;
  String cor;
  String descricao;
  String valor;

  Produto();

  Produto.fromMap(Map map) {
    id = map["id"];
    nome = map["nome"];
    cor = map["cor"];
    valor = map["valor"];
    descricao = map["descricao"];
  }

  Map toMap() {
    Map<String, dynamic> map = {
    "id" : id,
    "nome" : nome,
    "cor" : cor,
    "valor" : valor,
    "descricao" : descricao,
  };
    return map;
  }

}