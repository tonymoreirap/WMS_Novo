import 'package:flutter/material.dart';
import 'Classes/EstoquePicking.dart';
import 'Get/EnderecoApi.dart';
import 'Modelos/ClasseEndereco.dart';
import 'package:wms_pk/Get/EstoquePickingApi.dart';
import 'PrimeiraTela_Endereco_Origem.dart';
import 'TerceiraTela_Endereco_Destino.dart';

class SegundaTela_Produto extends StatefulWidget {

  final Endereco _endereco;

  SegundaTela_Produto(this._endereco);

  @override
  _SegundaTela_ProdutoState createState() => _SegundaTela_ProdutoState(_endereco);
}

class _SegundaTela_ProdutoState extends State<SegundaTela_Produto> {

  final Endereco _endereco;

  //Classes
  EstoquePicking _estoquePicking;
  EnderecoApi _enderecoApi = EnderecoApi();
  EstoquePickingApi _estoquePickingApi = EstoquePickingApi();
  Widget body;

  _SegundaTela_ProdutoState(this._endereco);

  //GlobalKey
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  //FocusNode
  FocusNode _focusQtdTransferida;
  FocusNode _focusButtonProximo;

  //Controlers
  TextEditingController _controlaProduto = TextEditingController();
  TextEditingController _qtdTransferidaController = TextEditingController();
  TextEditingController _qtdDisponivelController = TextEditingController();

  @override
  void initState() {
    _focusQtdTransferida = FocusNode();
    _focusButtonProximo = FocusNode();
    body = _body();
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
              "Transferência de Picking - Produto",
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

  _bodyLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _body(){
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
              "Produto",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold
              ),
            ),
            Container(
              padding: EdgeInsets.all(13),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Form(
                      child: TextFormField(
                        autofocus: true,
                        validator: (text) => _validadeProduto(text),
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: _onCodProdutoSubmitted,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "Bipagem do produto",
                          labelText: "Código do Produto",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22)
                          ),
                        ),
                        controller: _controlaProduto,
                      ),
                    ),

                  ),
                  Container(
                    padding: EdgeInsets.all(13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Descrição",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: 60,
                            height: 90,
                            child: Text(_estoquePicking == null ? "" : _estoquePicking.descProduto,
                              style: TextStyle
                                (fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center,
                            ),
                            padding: EdgeInsets.only(top: 35),
                            decoration: BoxDecoration(
                                border: Border.all(width: 0, color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 0
                                  ),
                                ]
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Emb",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              child: Text(
                                ("UND"),
                                style: TextStyle
                                  (fontSize: 20,
                                  color: Colors.red,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              padding: EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 3, color: Colors.black),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 0
                                    )
                                  ]
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Fator",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              child: Text(
                                ("1"),
                                style: TextStyle
                                  (fontSize: 20,
                                  color: Colors.red,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              padding: EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0, color: Colors.black),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 0
                                    )
                                  ]
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Disponível",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              child: Text(_estoquePicking == null ? "": _estoquePicking.qtdEstoque,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                                ),
                                textAlign: TextAlign.center,
                              ),
                              padding: EdgeInsets.only(top: 15),
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
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Qde.Transf",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                            Container(
                              color: Colors.white,
                              width: 75,
                              //height: 60,
                              padding: EdgeInsets.all(0),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  TextFormField(
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    keyboardType: TextInputType.number,
                                    controller: _qtdTransferidaController,
                                    validator: (text) => _validarQtdTransf(text),
                                    focusNode: _focusQtdTransferida,
                                    onFieldSubmitted: _qtdTransferidaOnSubmitted(),
                                    decoration: InputDecoration(
                                      hintText: "",
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(0)
                                      )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
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
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PrimeiraTela_Endereco_Origem(),
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
                        ),
                        RaisedButton(
                            child: Text("Próximo",
                            style: TextStyle(
                             fontSize: 15,
                             fontWeight: FontWeight.bold,
                             color: Colors.black
                              ),
                            ),
                            padding: EdgeInsets.all(15),
                            onPressed: _botaoProximo,
                            focusNode: _focusButtonProximo,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _botaoProximo() {
    if (!_formKey.currentState.validate()) return;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TerceiraTela_Endereco_Destino(_estoquePicking)));
  }

  _validadeProduto(text) {
    if ((_estoquePicking == null) | (text.isEmpty)) {
      return 'Produto obrigatório.';
    }
    return null;
  }

  _onCodProdutoSubmitted(text) {
    setState(() {
      body = FutureBuilder<EstoquePicking>(
          future: _estoquePickingApi.GetEstoque(_endereco.codEndereco, text),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              debugPrint("Dados: " + snapshot.data.toString());
              _estoquePicking = snapshot.data;
              if (snapshot.data == null) {
                var snackbar = SnackBar(
                    content:
                    Text("Endereço destino deve ser diferente do origem."));
                _scaffoldKey.currentState.showSnackBar(snackbar);
                return null;
              } else {
                _preencheValores();
                if (_estoquePicking.idEndereco == null) _estoquePicking = null;
                return _body();
              }
            } else if (snapshot.hasError) {
              debugPrint("ERROR: " + snapshot.toString());
              _estoquePicking = null;
              return _body();
            } else {
              return _bodyLoading();
            }
          });
    });

    FocusScope.of(context).requestFocus(_focusQtdTransferida);
  }

  _preencheValores() {}

  _validarQtdTransf(String text) {
    if ((text == "0") | (text.isEmpty)) {
      return "Quantidade Inválida.";
    }
  }

  _qtdTransferidaOnSubmitted() {
    print("_QtdTransferidaOnSubmitted: --->>");
    _focusQtdTransferida.unfocus();
//    FocusScope.of(context).requestFocus(_focusButtonProximo);
  }
}


