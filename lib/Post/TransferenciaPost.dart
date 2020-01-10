import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:wms_pk/Classes/PickingTransferencia.dart';

import '../Classes/TransferenciaPicking.dart';


class TransferenciaPost {

  var url = "http://192.168.1.2:8099/DataSnap/rest/TServiceEstoquePk/Transferir";


  Future<bool> Transferir(PickingTransferencia _pickingtransferencia) async {
    String jsonString = json.encode(_pickingtransferencia.toJson());

    final response = await http.post(url, body: jsonString);
    if (response.statusCode == 200) {
      debugPrint("response.body: " + response.body);
      return true;
    } else {
      return false;
    }
  }


}