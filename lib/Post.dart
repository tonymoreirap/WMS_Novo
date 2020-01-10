import 'package:flutter/material.dart';

class Post extends StatefulWidget {

  final int id;
  final int idEnderecoOrigem;
  final int idEnderecoDestino;
  final int idProduto;
  final int qtdTransferida;

  const Post({Key key, this.id, this.idEnderecoOrigem, this.idEnderecoDestino, this.idProduto, this.qtdTransferida}) : super(key: key);

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      idEnderecoOrigem: json['idEnderecoOrigem'],
      idEnderecoDestino: json['idEnderecoDestino'],
      idProduto: json['idProduto'],
      qtdTransferida: json['qtdTransferida'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["idEnderecoOrigem"] = idEnderecoOrigem;
    map["idEnderecoDestino"] = idEnderecoDestino;
    map["idProduto"] = idProduto;
    map["qtdTransferida"] = qtdTransferida;

    return map;
  }

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

