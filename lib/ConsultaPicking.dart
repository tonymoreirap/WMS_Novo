import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'Classes/EstoquePicking.dart';
import 'Get/EnderecoApi.dart';
import 'Get/EstoquePickingApi.dart';
import 'Modelos/ClasseEndereco.dart';


class ConsultaPicking extends StatefulWidget {



  @override
  _ConsultaPickingState createState() => _ConsultaPickingState();
}

class _ConsultaPickingState extends State<ConsultaPicking> with SingleTickerProviderStateMixin {

  String _escolhaOpcao;

/*
  final Endereco _endereco;
  _ConsultaPickingState(this._endereco);
*/

  //Classes
  EstoquePicking _estoquePicking;
  EnderecoApi _enderecoApi = EnderecoApi();
  EstoquePickingApi _estoquePickingApi = EstoquePickingApi();
  Widget body;

  //Controllers
  TabController _tabController;
  TextEditingController _controlaProduto = TextEditingController();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();



  @override
  void initState() {
    _tabController = TabController(
        length: 1,
        vsync: this
    );
  }

  final _formKey = GlobalKey<FormState>();

  bool _estaSelecionado = false;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Consulta de Picking",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.yellow,
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: EdgeInsets.only(right: 250),
            indicatorWeight: 30,
            indicatorColor: Colors.black26,
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            controller: _tabController,
            tabs: <Widget>[
            Tab (text: "Consulta",
            ),
            //Tab(text: "Endereço",),
          ],
          ),
        ),
          bottomNavigationBar: CurvedNavigationBar(
            initialIndex: 0,
            items: <Widget>[
              Icon(Icons.keyboard_backspace, size: 30),
              Icon(Icons.search, size: 30),
            ],
            color: Colors.blueAccent,
            buttonBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            animationCurve: Curves.easeInOutCirc,
            animationDuration: Duration(milliseconds: 600),
          ),

        body: Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Produto"),
                    Radio(
                      value: "Prod",
                      groupValue: _escolhaOpcao,
                      onChanged: _produtoEndereco,
                    ),
                    Text("Endereço"),
                    Radio(
                      value: "End",
                      groupValue: _escolhaOpcao,
                      onChanged: _produtoEndereco,
                    ),
                  ]
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Column (
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  CheckboxListTile(
                      title: Text("Visualizar somente endereços com saldo em estoque"),
                      activeColor: Colors.blueAccent,
                      controlAffinity: ListTileControlAffinity.leading,

                      value: _estaSelecionado,
                      onChanged: _checkBoxList
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 25, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Produto/Endereço",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 25, left: 10),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onFieldSubmitted: _onCodProdutoSubmitted,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      validator: _validadeCodProduto,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(30, 16, 30, 16),
                        labelText: "Produto/Endereço",
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontStyle: FontStyle.italic,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Bipagem produto ou endereço ",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      controller: _controlaProduto,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onCodProdutoSubmitted(text) {
    setState(() {
      FutureBuilder<EstoquePicking>(
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
                return Form();
              }
            } else if (snapshot.hasError) {
              debugPrint("ERROR: " + snapshot.toString());
              _estoquePicking = null;
              return Form();
            } else {
              return Form();
            }
          });
    });

  }

  _preencheValores() {}

  String _validadeCodProduto(String text) {
    if ((_estoquePicking == null) | (text == "")) {
      return "Produto obrigatório.";
    }
  }

void _checkBoxList(bool valor){
  setState(() {
    _estaSelecionado = valor;
  });
}

void _produtoEndereco(String opcao){
    setState(() {
      _escolhaOpcao = opcao;
    });
}

}

