

class Endereco {

  int id;
  int rua;
  int predio;
  int nivel;
  int apto;
  int situacao;
  int codTipoEnd;
  int codTipoAlmoxarifado;
  int codEstacao;
  int codDeposito;
  int bloqueado;

  Endereco ({this.id, this.rua, this.predio, this.nivel, this.apto,
    this.situacao, this.codTipoEnd, this.codTipoAlmoxarifado, this.codEstacao,
    this.codDeposito, this.bloqueado});

  factory Endereco.fromJson(Map<String, dynamic> parsedJson){
    return Endereco(
      id: parsedJson["id"],
      rua: parsedJson["rua"],
      predio: parsedJson["predio"],
      nivel: parsedJson["nivel"],
      apto: parsedJson["apto"],
      situacao: parsedJson["situacao"],
      codTipoEnd: parsedJson["codTipoEnd"],
      codTipoAlmoxarifado: parsedJson["codTipoAlmoxarifado"],
      codEstacao: parsedJson["codEstacao"],
      codDeposito: parsedJson["codDeposito"],
      bloqueado: parsedJson["bloqueado"],


    );
  }

}

