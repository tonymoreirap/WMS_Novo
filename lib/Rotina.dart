import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'PrimeiraTela_Endereco_Origem.dart';

class Rotina extends StatefulWidget {
  @override
  _RotinaState createState() => _RotinaState();
}

class _RotinaState extends State<Rotina> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: <Widget>[
            Image.asset(
                "imagens/WMS_Fundo.jpg",
              width: double.maxFinite,
              fit: BoxFit.fill,
              height: 250,
            ),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Image.asset(
              "imagens/WMS_Expert.png",
              width: double.maxFinite,
            height: 100,
          ),
        ),
            Positioned(
              top: 150,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(62),
                      topRight: Radius.circular(62)
                  )
                ),
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Text(
                        "Rotinas",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 400,
                      padding: EdgeInsets.all(10),
                      child: ListView (
                        children: <Widget>[
                          GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PrimeiraTela_Endereco_Origem()
                                    )
                                );
                              },
                              child: Card(
                                elevation: 10,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 121),
                                  child: Text(
                                    "Recebimento",
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  ),
                                ),
                              )
                          ),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PrimeiraTela_Endereco_Origem()
                                    )
                                );
                              },
                              child: Card(
                                elevation: 10,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 110),
                                  child: Text(
                                    "Armazenamento",
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  ),
                                ),
                              )
                          ),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PrimeiraTela_Endereco_Origem()
                                    )
                                );
                              },
                              child: Card(
                                elevation: 10,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                                  child: Text(
                                    "Consulta de Picking",
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  ),
                                ),
                              )
                          ),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PrimeiraTela_Endereco_Origem()
                                    )
                                );
                              },
                              child: Card(
                                elevation: 10,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 107),
                                  child: Text(
                                    "Consulta Pulmão",
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  ),
                                ),
                              )
                          ),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PrimeiraTela_Endereco_Origem()
                                    )
                                );
                              },
                              child: Card(
                                elevation: 10,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 83),
                                  child: Text(
                                    "Transferência de Picking",
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  ),
                                ),
                              )
                          ),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PrimeiraTela_Endereco_Origem()
                                    )
                                );
                              },
                              child: Card(
                                elevation: 10,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 78),
                                  child: Text(
                                    "Expedição Multi Endereço",
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  ),
                                ),
                              )
                          ),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PrimeiraTela_Endereco_Origem()
                                    )
                                );
                              },
                              child: Card(
                                elevation: 10,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 110),
                                  child: Text(
                                    "Inventário Livre",
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  ),
                                ),
                              )
                          ),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PrimeiraTela_Endereco_Origem()
                                    )
                                );
                              },
                              child: Card(
                                elevation: 10,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 85),
                                  child: Text(
                                    "Mapeamento de Picking",
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  ),
                                ),
                              )
                          ),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PrimeiraTela_Endereco_Origem()
                                    )
                                );
                              },
                              child: Card(
                                elevation: 10,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 92),
                                  child: Text(
                                    "Devolução de Pedidos",
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  ),
                                ),
                              )
                          ),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PrimeiraTela_Endereco_Origem()
                                    )
                                );
                              },
                              child: Card(
                                elevation: 10,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 83),
                                  child: Text(
                                    "Mapeamento EAN Caixa",
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  ),
                                ),
                              )
                          ),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PrimeiraTela_Endereco_Origem()
                                    )
                                );
                              },
                              child: Card(
                                elevation: 10,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 110),
                                  child: Text(
                                    "Alterar Validade",
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  ),
                                ),
                              )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 580, bottom: 11, left: 200),
              child: RaisedButton(
                  child: Text(
                    "Acessar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17
                    ),
                  ),
                  color: Color(0xff1ebbd8),
                  padding: EdgeInsets.fromLTRB(18, 16, 18, 16),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrimeiraTela_Endereco_Origem()
                        )
                    );
                  }
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 580, bottom: 11, left: 60),
              child: RaisedButton(
                  child: Text(
                    "Sair",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17
                    ),
                  ),
                  color: Color(0xff1ebbd8),
                  padding: EdgeInsets.fromLTRB(18, 16, 18, 16),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrimeiraTela_Endereco_Origem()
                        )
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

