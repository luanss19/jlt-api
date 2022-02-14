import 'dart:collection';
import 'dart:io';
import 'dart:convert';
import 'package:app_jlt/model/Produto.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../main.dart';

const requisicaoLocal =
    "http://10.0.2.2:1515/";

 class PersistenciaAPI {

   List produtos = [];
   List servicos = [];
   List usuarios = [];

   //Requisição GET PRODUTO
   Future<Map> carregarProduto() async {
     Map<String, String> headers = HashMap();
     headers ["Authorization"] =
     'Basic \$2y\$10\$54uCli6bb28Y3BtlLTzeb.Seg6JPiKneoDpjbaxZa.xCo/vFtwkTW';

     print("Fazendo requisição GET");

     http.Response resposta = await http.get(
         "$requisicaoLocal/produtos",
         headers: headers
     );

     print("Resposta do GET da API ${resposta.body}");

     if (resposta.statusCode == 200 || resposta.statusCode == 204) {
       produtos = json.decode(resposta.body);
       return json.decode(resposta.body);
     }
     return null;
   }

   //Requisição POST PRODUTO

   Future<Map> inserirNovoProduto() async {
     print("Inserindo novo Produto...");
     Map <String, String> headers = HashMap();
     headers ["Authorization"] =
     'Basic \$2y\$10\$54uCli6bb28Y3BtlLTzeb.Seg6JPiKneoDpjbaxZa.xCo/vFtwkTW';
     headers['Accept'] = 'application/json';
     headers['Content-type'] = 'application/json';

     http.Response resposta = await http.post(
         "$requisicaoLocal/produtos",
         headers: headers,
         body: json.encode(api.produto.toMap()),
         encoding: Encoding.getByName('utf-8')
     );
     print("Resposta da inserção: ${resposta.body}");

     if (resposta.statusCode == 200 || resposta.statusCode == 201) {
       api.produto.id = json.decode(resposta.body)['id'];
       print("ID Gerado : ${api.produto.id}");
       return json.decode(resposta.body);
     }
     return null;
   }

   //Requsição PUT PRODUTO
   Future<Map> atualizarProduto() async {
     print("Atualizando Produto...");
     Map <String, String> headers = HashMap();
     headers ["Authorization"] =
     'Basic \$2y\$10\$54uCli6bb28Y3BtlLTzeb.Seg6JPiKneoDpjbaxZa.xCo/vFtwkTW';
     headers['Accept'] = 'application/json';
     headers['Content-type'] = 'application/json';

     http.Response resposta = await http.put(
         "$requisicaoLocal/produtos/${api.produto.id}",
         headers: headers,
         body: json.encode(api.produto.toMap()),
         encoding: Encoding.getByName('utf-8')
     );
     print("Corpo da atualização: ${resposta.body}");
     print("Código de status: ${resposta.statusCode}");

     if(resposta.statusCode == 200 || resposta.statusCode == 201) {
       print("ID Atualizado = ${api.produto.id}");
       return json.decode(resposta.body);
     }
     return null;
   }


   //Requsição DELETE PRODUTO
   Future<Map> deletarProduto() async {
     print("Deletando Produto...");
     Map <String, String> headers = HashMap();
     headers ["Authorization"] =
     'Basic \$2y\$10\$54uCli6bb28Y3BtlLTzeb.Seg6JPiKneoDpjbaxZa.xCo/vFtwkTW';

     http.Response resposta = await http.delete(
       "$requisicaoLocal/produtos/${api.produto.id}",
       headers: headers,
     );
     print("Status code: ${resposta.statusCode}");

     if (resposta.statusCode == 200 || resposta.statusCode == 201) {
       print("ID deletado : ${api.produto.id}");
     }
   }

   //Requisição GET SERVICO
   Future<Map> carregarServico() async {
     Map<String, String> headers = HashMap();
     headers ["Authorization"] =
     'Basic \$2y\$10\$54uCli6bb28Y3BtlLTzeb.Seg6JPiKneoDpjbaxZa.xCo/vFtwkTW';

     print("Fazendo requisição GET");

     http.Response resposta = await http.get(
         "$requisicaoLocal/servicos",
         headers: headers
     );

     print("Resposta do GET da API ${resposta.body}");


     if (resposta.statusCode == 200 || resposta.statusCode == 204) {
       servicos = json.decode(resposta.body);
       return json.decode(resposta.body);
     }
     return null;
   }



   //Requisição POST SERVICO

   Future<Map> inserirNovoServico() async {
     print("Inserindo novo Servico...");
     Map <String, String> headers = HashMap();
     headers ["Authorization"] =
     'Basic \$2y\$10\$54uCli6bb28Y3BtlLTzeb.Seg6JPiKneoDpjbaxZa.xCo/vFtwkTW';
     headers['Accept'] = 'application/json';
     headers['Content-type'] = 'application/json';

     http.Response resposta = await http.post(
         "$requisicaoLocal/servicos",
         headers: headers,
         body: json.encode(api.servico.toMap()),
         encoding: Encoding.getByName('utf-8')
     );
     print("Resposta da inserção: ${resposta.body}");

     if (resposta.statusCode == 200 || resposta.statusCode == 201) {
       api.servico.id = json.decode(resposta.body)['id'];
       print("ID Gerado : ${api.servico.id}");
       return json.decode(resposta.body);
     }
     return null;
   }

   //Requsição PUT SERVICO
   Future<Map> atualizarServico() async {
     print("Atualizando Produto...");
     Map <String, String> headers = HashMap();
     headers ["Authorization"] =
     'Basic \$2y\$10\$54uCli6bb28Y3BtlLTzeb.Seg6JPiKneoDpjbaxZa.xCo/vFtwkTW';
     headers['Accept'] = 'application/json';
     headers['Content-type'] = 'application/json';

     http.Response resposta = await http.put(
         "$requisicaoLocal/servicos/${api.servico.id}",
         headers: headers,
         body: json.encode(api.servico.toMap()),
         encoding: Encoding.getByName('utf-8')
     );
   }

   //Requsição DELETE SERVICO
   Future<Map> deletarServico() async {
     print("Deletando Servico...");
     Map <String, String> headers = HashMap();
     headers ["Authorization"] =
     'Basic \$2y\$10\$54uCli6bb28Y3BtlLTzeb.Seg6JPiKneoDpjbaxZa.xCo/vFtwkTW';

     http.Response resposta = await http.delete(
       "$requisicaoLocal/servicos/${api.servico.id}",
       headers: headers,
     );
     print("Status code: ${resposta.statusCode}");

     if (resposta.statusCode == 200 || resposta.statusCode == 201) {
       print("ID deletado : ${api.servico.id}");
     }
   }

   //Requisição GET USUARIO
   Future<Map> carregarUsuario() async {
     Map<String, String> headers = HashMap();
     headers ["Authorization"] =
     'Basic \$2y\$10\$54uCli6bb28Y3BtlLTzeb.Seg6JPiKneoDpjbaxZa.xCo/vFtwkTW';

     print("Fazendo requisição GET");

     http.Response resposta = await http.get(
         "$requisicaoLocal/usuarios",
         headers: headers
     );

     print("Resposta do GET da API ${resposta.body}");

     if (resposta.statusCode == 200 || resposta.statusCode == 204) {
       usuarios = json.decode(resposta.body);
       return json.decode(resposta.body);
     }
     return null;
   }

   //Requisição POST USUARIO

   Future<Map> inserirNovoUsuario() async {
     print("Inserindo novo Usuario...");
     Map <String, String> headers = HashMap();
     headers ["Authorization"] =
     'Basic \$2y\$10\$54uCli6bb28Y3BtlLTzeb.Seg6JPiKneoDpjbaxZa.xCo/vFtwkTW';
     headers['Accept'] = 'application/json';
     headers['Content-type'] = 'application/json';

     http.Response resposta = await http.post(
         "$requisicaoLocal/usuarios",
         headers: headers,
         body: json.encode(api.usuario.toMap()),
         encoding: Encoding.getByName('utf-8')
     );
     print("Resposta da inserção: ${resposta.body}");

     if (resposta.statusCode == 200 || resposta.statusCode == 201) {
       api.usuario.id = json.decode(resposta.body)['id'];
       print("ID Gerado : ${api.usuario.id}");
       return json.decode(resposta.body);
     }
     return null;
   }

   //Requsição PUT USUARIO
   Future<Map> atualizarUsuario() async {
     print("Atualizando Usuario...");
     Map <String, String> headers = HashMap();
     headers ["Authorization"] =
     'Basic \$2y\$10\$54uCli6bb28Y3BtlLTzeb.Seg6JPiKneoDpjbaxZa.xCo/vFtwkTW';
     headers['Accept'] = 'application/json';
     headers['Content-type'] = 'application/json';

     http.Response resposta = await http.put(
         "$requisicaoLocal/usuarios/${api.usuario.id}",
         headers: headers,
         body: json.encode(api.usuario.toMap()),
         encoding: Encoding.getByName('utf-8')
     );
   }

   //Requsição DELETE USUARIO
   Future<Map> deletarUsuario() async {
     print("Deletando Usuario...");
     Map <String, String> headers = HashMap();
     headers ["Authorization"] =
     'Basic \$2y\$10\$54uCli6bb28Y3BtlLTzeb.Seg6JPiKneoDpjbaxZa.xCo/vFtwkTW';

     http.Response resposta = await http.delete(
       "$requisicaoLocal/usuarios/${api.usuario.id}",
       headers: headers,
     );
     print("Status code: ${resposta.statusCode}");

     if (resposta.statusCode == 200 || resposta.statusCode == 201) {
       print("ID deletado : ${api.usuario.id}");
     }
   }

 }