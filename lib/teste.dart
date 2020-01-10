import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste"),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Emb",
                  style: TextStyle(
                    color: Colors.red
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: 60,
                  //height: 70,
                  padding: EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.amber,
                              fontStyle: FontStyle.italic,
                            ),
                            filled: true,
                            fillColor: Colors.red,
                            hintText: "",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(1)
                            )
                        ),
                      )
                    ],
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
                      color: Colors.red
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: 60,
                  //height: 20,
                  padding: EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                            filled: true,
                            fillColor: Colors.red,
                            hintText: "",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(1)
                            )
                        ),
                      )
                    ],
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
                      color: Colors.red
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: 60,
                  //height: 20,
                  padding: EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.black26,
                              fontStyle: FontStyle.italic,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(1)
                            )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Qde.Transf",
                  style: TextStyle(
                      color: Colors.red
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: 60,
                  //height: 20,
                  padding: EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: Colors.black26,
                              fontStyle: FontStyle.italic,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                            )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
