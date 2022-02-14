class Servico {
  int id;
  String nome;
  String valor;
  String descricao;

  Servico();

  Servico.fromMap(Map map) {
    id = map["id"];
    nome = map["nome"];
    valor = map["valor"];
    descricao = map["descricao"];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "id" : id,
      "nome" : nome,
      "valor" : valor,
      "descricao" : descricao,
    };
    return map;
  }

}