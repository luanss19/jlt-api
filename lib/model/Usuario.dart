class Usuario {
  int id;
  String nome;
  String login;
  String senha;

  Usuario();

  Usuario.fromMap(Map map) {
    id = map["id"];
    nome = map["nome"];
    login = map["login"];
    senha = map["senha"];
  }

  Map toMap() {
    Map<String, dynamic> map = {
    "id" : id,
    "nome" : nome,
    "login" : login,
    "senha" : senha,
    };
    return map;
    }

}