import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'Classes/EstoquePicking.dart';
import 'Get/EnderecoApi.dart';
import 'Get/EstoquePickingApi.dart';

class ConsultaPK_Endereco extends StatefulWidget {


  @override
  _ConsultaPK_EnderecoState createState() => _ConsultaPK_EnderecoState();
}

class _ConsultaPK_EnderecoState extends State<ConsultaPK_Endereco> with SingleTickerProviderStateMixin {

  //Classes
  EstoquePicking _estoquePicking;
  EnderecoApi _enderecoApi = EnderecoApi();
  EstoquePickingApi _estoquePickingApi = EstoquePickingApi();
  Widget body;

  //Controllers
  TabController _tabController;

  final _formKey = GlobalKey<FormState>();

@override
  void initState() {
  _tabController = TabController(
      length: 1,
      vsync: this
  );
}

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
            labelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: EdgeInsets.only(right: 250),
            indicatorWeight: 1,
            indicatorColor: Colors.black26,
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            controller: _tabController,
            tabs: <Widget>[
              Tab (text: "Endereço",
              ),
            ],
          ),
        ),
          bottomNavigationBar: _getNavBar(context),
/*        bottomNavigationBar: CurvedNavigationBar(
          initialIndex: 0,
          items: <Widget>[
            Icon(Icons.cancel,
                size: 40,
                color: Colors.blueAccent,
            ),
            Icon(Icons.assignment,
                size: 40,
                color: Colors.red,
            ),
          ],
          color: Colors.white24,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInCubic,
          animationDuration: Duration(milliseconds: 600),
        ),*/
/*        bottomNavigationBar: BottomAppBar(
          notchMargin: 4,
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
          //shape: CircularNotchedRectangle(), //Borda circular no botão
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.assignment),
                iconSize: 40,
                color: Colors.blueAccent,
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.cancel),
                iconSize: 40,
                color: Colors.red,
              )
            ],
          ),
        ),*/
        body: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
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
          )
          ),
        ),
      );
  }

  _getNavBar(context) {
  return Stack(
    children: <Widget>[
      Positioned(
        bottom: 0,
        child: ClipPath(
          clipper: NavBarClipper(),
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue,
                  Colors.blueAccent,
                ]
              )
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 40,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildNavItem(Icons.arrow_back,false),
            SizedBox(width: 1,),
            _buildNavItem(Icons.search,false),
            SizedBox(width: 1,),
            _buildNavItem(Icons.exit_to_app,false),
          ],
        ),
      ),
      Positioned(
        bottom: 10,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Voltar",
              style:
              TextStyle(
              color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
            ),
            ),
            SizedBox(width: 1,),
            Text(
              "Nova Consulta",
              style:
              TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(width: 1,),
            Text(
              "Sair",
              style:
              TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
      )
    ],
  );
  }

  _buildNavItem(IconData icon, bool active) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.blueAccent,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: active ? Colors.white.withOpacity(0.9) : Colors.transparent,
        child: Icon(icon, color: Colors.white,),
      ),
    );
  }
}

class NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.cubicTo(sw/12, 0, sw/12, 2*sh/5, 2*sw/12, 2*sh/5);
    path.cubicTo(3*sw/12, 2*sh/5, 3*sw/12, 0, 4*sw/12, 0);
    path.cubicTo(5*sw/12, 0, 5*sw/12, 2*sh/5, 6*sw/12, 2*sh/5);
    path.cubicTo(7*sw/12, 2*sh/5, 7*sw/12, 0, 8*sw/12, 0);
    path.cubicTo(9*sw/12, 0, 9*sw/12, 2*sh/5, 10*sw/12, 2*sh/5);
    path.cubicTo(11*sw/12, 2*sh/5, 11*sw/12, 0, sw, 0);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper)=> false;
}
