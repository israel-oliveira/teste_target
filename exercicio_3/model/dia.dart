import 'package:xml/xml.dart';

class Dia {
  int? dia;
  double? valor;

  Dia(this.dia, this.valor);

  Dia.fromJson(Map<String, dynamic> json) {
    dia = json["dia"];
    valor = json["valor"];
  }

  Dia.fromXml(XmlElement row) {
    dia = int.parse(row.findElements('dia').single.innerText);
    valor = double.parse(row.findElements('valor').single.innerText);
  }
}
