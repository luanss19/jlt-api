import 'package:app_jlt/telas/opcoes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_jlt/model/api.dart';

API api = API ();
void main() {
  runApp(MaterialApp(
    title: 'JLT Informatica',
    home: Login(),
  ));
}


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _chaveForm = GlobalKey<FormState>();


  TextEditingController _LoginUserController = TextEditingController();
  TextEditingController _SenhaUserController = TextEditingController();

  String _Login = "admin";
  String _senha = "admin";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _chaveForm,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 80.0, 40.0, 40.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _LoginUserController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Login",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    validator: (texto) {
                      if (texto.length < 1) {
                        return "Login em branco";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 40.0),
                  child: TextFormField(
                    obscureText: true,
                    controller: _SenhaUserController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    validator: (texto) {
                      if (texto.length < 1) {
                        return "Senha em branco";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 40.0),
                  child: RaisedButton(
                      child: Text("LOGIN"),
                      onPressed: () {
                        //valida se os campos estão preenchidos
                        if (_chaveForm.currentState.validate()) {
                          //verifica se é usuario padrão (admin) salvo na variavel
                          if (_SenhaUserController.text == _senha &&
                              _LoginUserController.text == _Login) {
                            Navigator.push(  context,
                                MaterialPageRoute(
                                    builder: (contex) => Opcoes()));

                          } else {
                            _alertImagem();
                          }
                        }
                      }),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> _alertImagem() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Usuario ou senha invalidos"),
            content: Text("Verifique o usuario e senha e tente novamente  "),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
