import 'package:flutter/material.dart';
import 'package:wms_pk/ConsultaPK_Endereco.dart';
import 'package:wms_pk/ConsultaPicking.dart';
import 'package:wms_pk/teste.dart';
import 'package:intl/intl.dart';
import 'package:wms_pk/teste2.dart';
import 'dart:convert';
import 'SegundaTela_Produto.dart';
import 'Login.dart';
import 'PrimeiraTela_Endereco_Origem.dart';
import 'TerceiraTela_Endereco_Destino.dart';
import 'Rotina.dart';


void main (){



  runApp(MaterialApp(
    //home: Teste(),
    //home: Confirma_Pk(),
    //home: Picking_Destino(),
    //home: Login(),
    //home: Rotina(),
    //home: PrimeiraTela_Endereco_Origem(),
    home: ConsultaPicking(),
    //home: ConsultaPK_Endereco(),
    debugShowCheckedModeBanner: false,
  ));
}