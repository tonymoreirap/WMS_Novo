import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class teste2 extends StatefulWidget {
  @override
  _teste2State createState() => _teste2State();
}

class _teste2State extends State<teste2> {

  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // limpa o no focus quando o form for liberado.
    myFocusNode.dispose();
    super.dispose();
  }



  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  _recuperarDados() async {

    String _resultado = "Resultado";
    String url = "http://181.222.137.89:8099/DataSnap/rest/TServiceEndereco/GetEndereco/${_resultado}";
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    String id = retorno["id"];
    String rua = retorno["rua"];
    String predio = retorno["predio"];
    String nivel = retorno["nivel"];
    String apto = retorno["apto"];
    String situacao = retorno["situacao"];
    String codTipoEnd = retorno["codTipoEnd"];
    String codTipoAlmoxarifado = retorno["codTipoAlmoxarifado"];
    String codEstacao = retorno["codEstacao"];
    String codDeposito = retorno["codDeposito"];
    String bloqueado = retorno["bloqueado"];

    setState(() {
      _resultado = "${id}, ${rua}, ${predio}, ${nivel}, apto: ${apto} ";
    });

    print (
        "Resposta: id: ${id} rua: ${rua} predio: ${predio} nivel: ${nivel} apto: ${apto}  "
    );
    
    //print("resposta: " + response.body);
    //print("resposta: " + response.statusCode.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              TextField(
                autofocus: true,
                onSubmitted: (ok){
                  print(('ok: ${ok}'));
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(30, 16, 30, 16),
                  labelText: "Endereço Picking - Origem",
                  hintStyle: TextStyle(
                    color: Colors.black26,
                    fontStyle: FontStyle.italic,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Bipar no endereço de Origem",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
              Container(
                child: RaisedButton(
                    onPressed: null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }




}
