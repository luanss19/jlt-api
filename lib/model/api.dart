import 'package:app_jlt/model/Produto.dart';
import 'package:app_jlt/model/Servico.dart';
import 'package:app_jlt/model/Usuario.dart';
import 'persistencia.dart';

class API {
  Produto produto;
  Usuario usuario;
  Servico servico;
  PersistenciaAPI persistencia;

  API() {
    produto = Produto();
    servico = Servico();
    usuario = Usuario();
    persistencia = PersistenciaAPI();

  }


}
