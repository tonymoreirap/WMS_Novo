import 'package:flutter/material.dart';
import 'package:wms_pk/Get/EnderecoApi.dart';
import 'package:wms_pk/Rotina.dart';
import 'Modelos/ClasseEndereco.dart';
import 'Get/EnderecoApi.dart';
import 'package:wms_pk/SegundaTela_Produto.dart';
import 'package:flutter/cupertino.dart';


class PrimeiraTela_Endereco_Origem extends StatefulWidget {
  @override
  _PrimeiraTela_Endereco_OrigemState createState() => _PrimeiraTela_Endereco_OrigemState();
}

class _PrimeiraTela_Endereco_OrigemState extends State<PrimeiraTela_Endereco_Origem> {


  //Focus
  FocusNode _focusProximo;

  //Classes
  Endereco _endereco; //Endereço/Depósito
  Endereco endereco; //Rua/Prédio/Nível/Apartamento (Blocos)
  EnderecoApi _enderecoApi = EnderecoApi();

  Widget body;

  get listDrop => null;


  @override
  void initState() {
    body = _body();
    _focusProximo = FocusNode();
  }

  @override
  void dispose() {
    _controlaEndereco.dispose();
    _focusProximo.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  //Controlers
  TextEditingController _controlaEndereco = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Transferência de Picking - Origem",
            style: TextStyle(
                fontSize: 17,
                color: Colors.white
            ),
          ),
        ),
        body: body,
      ),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            TextFormField(
              autofocus: true,
              onFieldSubmitted: _onCodEnderecoSubmitted,
              maxLines: 1,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              validator: _validadeCodEndereco,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(30, 16, 30, 16),
                labelText: "Endereço Picking - Origem",
                hintStyle: TextStyle(
                  color: Colors.black26,
                  fontStyle: FontStyle.italic,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: "Bipar no endereço de Origem ",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              controller: _controlaEndereco,
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Endereço: " +
                        (_endereco == null ? "00" : _endereco.codEndereco),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "Depósito: " +
                        (_endereco == null ? "00" : _endereco.codDeposito),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Rua",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "Prédio",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "Nível",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "Apto",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //Text("0", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),),
                    Padding(
                      padding: EdgeInsets.only(),
                      child: Container(
                        width: 60,
                        height: 60,
                        child: Text(
                          (_endereco == null ? "0" : _endereco.rua),
                          style: TextStyle
                            (fontSize: 45,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: EdgeInsets.only(),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0, color: Colors.black),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 0
                              )
                            ]
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 0),
                      child: Container(
                        width: 60,
                        height: 60,
                        child: Text(
                          (_endereco == null ? "0" : _endereco.predio),
                          style: TextStyle
                            (fontSize: 45,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: EdgeInsets.only(),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0, color: Colors.black),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 0
                              )
                            ]
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 0),
                      child: Container(
                        width: 60,
                        height: 60,
                        child: Text(
                          (_endereco == null ? "0" : _endereco.nivel),
                          style: TextStyle
                            (fontSize: 45,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: EdgeInsets.only(),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0, color: Colors.black),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 0
                              )
                            ]
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 0),
                      child: Container(
                        width: 60,
                        height: 60,
                        child: Text(
                          (_endereco == null ? "0" : _endereco.apto),
                          style: TextStyle
                            (fontSize: 45,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: EdgeInsets.only(),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0, color: Colors.black),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 0
                              )
                            ]
                        ),
                      ),
                    ),
                  ],
                )
            ),
            Container(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Tipo de Endereço",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
            ),
            Container(
                padding: EdgeInsets.only(top: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    DropdownButton(
                      items: listDrop,
                      hint: Text("Endereço Picking Fracionado"),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (value) =>
                          print("Picking Fracionado: $value"),
                    ),
                  ],
                )
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      "Cancelar",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    padding: EdgeInsets.all(15),
                    onPressed: _botaoCancelar,
                  ),
                  RaisedButton(
                    child: Text(
                      "Próximo",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                    padding: EdgeInsets.all(15),
                    onPressed: _pressProximo,
                    focusNode: _focusProximo,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _bodyLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  String _validadeCodEndereco(String text) {
    if ((_endereco == null) | (text == "")) {
      return "Endereço obrigatório.";
    }
  }

  _onCodEnderecoSubmitted(text) async {
    debugPrint("Endereço: " + text);
    setState(() {
      body = FutureBuilder<Endereco>(
          future: _enderecoApi.GetEndereco(text),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              debugPrint("Dados: " + snapshot.data.toString());
              _endereco = snapshot.data;
              if (_endereco.codEndereco == null) _endereco = null;
              return _body();
            } else if (snapshot.hasError) {
              debugPrint("ERROR: " + snapshot.toString());
              _endereco = null;
              return _body();
            } else {
              return _bodyLoading();
            }
          });
    });
    FocusScope.of(context).requestFocus(_focusProximo);
  }

  _listenerCodEndereco() {
    if (_controlaEndereco.text.isEmpty) {
      setState(() {
        _endereco = null;
      });
      return;
    }
    print("listenerCodEndereco: ${_controlaEndereco.text}");
    _onCodEnderecoSubmitted(_controlaEndereco.text);
    FocusScope.of(context).requestFocus(_focusProximo);
  }


  _pressProximo() {
    if (_formKey.currentState.validate())
      Navigator.push(context,
          MaterialPageRoute(builder:
              (context) => SegundaTela_Produto(_endereco)));
  }

  _botaoCancelar() {
    if (_formKey.currentState.validate()) {
      Navigator.push(context,
          MaterialPageRoute(builder:
              (context) => Rotina()));
    }
  }

}
