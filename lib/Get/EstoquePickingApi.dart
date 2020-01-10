import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:wms_pk/Classes/EstoquePicking.dart';

class EstoquePickingApi {
  var url =
      "http://192.168.1.2:8099/DataSnap/rest/TServiceEstoquePk/GetEstoque/";

  Future<EstoquePicking> GetEstoque(codEndereco, codProduto) async {
    final response = await http.get(url + codEndereco + '/' + codProduto);
    if (response.statusCode == 200) {
      debugPrint("response.body: " + response.body);
      return EstoquePicking.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao buscar estoque do produto');
    }
  }
}