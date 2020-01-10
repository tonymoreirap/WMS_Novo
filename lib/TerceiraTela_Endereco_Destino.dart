import 'package:flutter/material.dart';
import 'package:wms_pk/PrimeiraTela_Endereco_Origem.dart';
import 'package:wms_pk/Rotina.dart';
import 'Classes/EstoquePicking.dart';
import 'Classes/PickingTransferencia.dart';
import 'Get/EnderecoApi.dart';
import 'Modelos/ClasseEndereco.dart';
import 'Post/TransferenciaPost.dart';
import 'SegundaTela_Produto.dart';

class TerceiraTela_Endereco_Destino extends StatefulWidget {

  final EstoquePicking _estoquePicking;
  TerceiraTela_Endereco_Destino(this._estoquePicking);


  @override
  _TerceiraTela_Endereco_DestinoState createState() => _TerceiraTela_Endereco_DestinoState(_estoquePicking);}



class _TerceiraTela_Endereco_DestinoState extends State<TerceiraTela_Endereco_Destino> {

  final EstoquePicking _estoquePicking;

  _TerceiraTela_Endereco_DestinoState(this._estoquePicking);

  //GlobalKey
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  //FocusNode
  FocusNode _focusBotaoFinalizar = FocusNode();
  FocusNode _focusEnderecoDestino = FocusNode();
  FocusNode _focusKeyBoard = FocusNode();

  //Controllers
  final _controlaDestino = TextEditingController();

  //Classes
  PickingTransferencia _pickingTransferencia = PickingTransferencia();
  TransferenciaPost _transferenciaPost = TransferenciaPost();
  EnderecoApi _enderecoApi = EnderecoApi();
  Endereco _endereco;


  Widget body;

  @override
  void initState() {
    body = _body();
  }

  @override
  void dispose() {
    _focusKeyBoard.dispose();
    _focusEnderecoDestino.dispose();
    _focusBotaoFinalizar.dispose();
    super.dispose();
  }

  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  List<DropdownMenuItem<int>> listDrop = [];

  void loadData() {
    listDrop.add(
        new DropdownMenuItem
          (child: new Text(
          "",
        ),
          value: 1,
        )
    );
  }




  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        key: _formKey,
        appBar: AppBar(
          title: Text("Transferência de Picking - Destino",
            style: TextStyle(
                fontSize: 17
            ),
          ),
          centerTitle: true,
        ),
        body: body,
      ),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
            ),
            Text(
              "Endereço",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: TextFormField(
                      autofocus: true,
                      onFieldSubmitted: _onCodEnderecoSubmitted,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      validator: _validarCodEndereco,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(30, 16, 30, 16),
                        labelText: "Endereço Picking - Destino",
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontStyle: FontStyle.italic,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Bipar no endereço de Destino ",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      controller: _controlaDestino,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  "Endereço Mapeado: ",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  "Depósito: ",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
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
                          _endereco == null ? "0" : _endereco.rua,
                          style: TextStyle
                            (fontSize: 35,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 0, color: Colors.black),
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
                          _endereco == null ? "0" : _endereco.predio,
                          style: TextStyle
                            (fontSize: 35,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 0, color: Colors.black),
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
                          _endereco == null ? "0" : _endereco.nivel,
                          style: TextStyle
                            (fontSize: 35,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 0, color: Colors.black),
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
                          _endereco == null ? "0" : _endereco.apto,
                          style: TextStyle
                            (fontSize: 35,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 0, color: Colors.black),
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
              child: Padding(
                padding: EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    Text(
                      "Tipo de Armazenagem ",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
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
                      onChanged: (value) => print("Picking Fracionado: $value"),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    Text(
                      "Validade do Produto ",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.date_range),
                      color: Colors.red,
                      onPressed: () => _date,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      "Voltar",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    padding: EdgeInsets.all(15),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SegundaTela_Produto(_endereco),
                          )
                      );
                    },
                  ),
                  RaisedButton(
                      child: Text(
                        "Limpar",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      padding: EdgeInsets.all(15),
                      onPressed: () {}
                  ),
                  RaisedButton(
                    child: Text(
                      "Finalizar",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    padding: EdgeInsets.all(15),
                    onPressed: _clickDoFinalizar,
                    focusNode: _focusBotaoFinalizar,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(){
    showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Transferência de Picking"),
            content: Text("Transferência concluida com Sucesso!"),
            actions: <Widget>[
              FlatButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrimeiraTela_Endereco_Origem()));
                  },
                  child: Text("OK")
              )
            ],
          );
        }
    );
  }

  _clickDoFinalizar() {
    if (_formKey.currentState != null) return;
    _pickingTransferencia.id = _estoquePicking.id;
    _pickingTransferencia.idEnderecoOrigem = _estoquePicking.idEndereco;
    _pickingTransferencia.idEnderecoDestino = _controlaDestino.text;
    _pickingTransferencia.idProduto = _estoquePicking.idProduto;
    _pickingTransferencia.qtdTransferida = _estoquePicking.qtdEstoque;


    if (!_validaFinalizar()) return;

    setState(() {
      body = FutureBuilder<bool>(
          future: _transferenciaPost.Transferir(_pickingTransferencia),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              debugPrint("Dados: " + snapshot.data.toString());
              return _body();
            } else if (snapshot.hasError) {
              debugPrint("ERROR: " + snapshot.toString());
              return _body();
            } else {
              return _bodyLoading();
            }
          });
    });

    _showAlertDialog();

  }


    String _validarCodEndereco(String text) {
      if ((_endereco == null) | (text == "")) {
        return "Endereço obrigatório.";
      }
    }

    _bodyLoading() {
      return Center(
        child: CircularProgressIndicator(),
      );
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
      _focusEnderecoDestino.unfocus();
    }

    bool _validaFinalizar() {
      var ok = true;

      if (_endereco.codEndereco == _estoquePicking.idEndereco) {
        var snackbar = SnackBar(
            content: Text("Endereço destino deve ser diferente do origem."));
        _scaffoldKey.currentState.showSnackBar(snackbar);
        ok = false;
      }
      return ok;
    }



}
