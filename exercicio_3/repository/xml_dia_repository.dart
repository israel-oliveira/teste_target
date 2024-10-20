import 'package:xml/xml.dart';

import '../model/dia.dart';
import 'dart:io';
import 'dia_repository_interface.dart';

class XmlDiaRepository extends DiaRepositoryInterface {
  @override
  Future<List<Dia>> getDias(String path) async {
    final file = File(path);
    try {
      String conteudo = await file.readAsString();

      final arquivo = XmlDocument.parse(conteudo);

      final xmlList = arquivo.findAllElements('row');

      List<Dia> dias = [];

      for (var row in xmlList) {
        Dia dia = Dia.fromXml(row);
        dias.add(dia);
      }

      return dias;
    } catch (e, s) {
      print('Erro ao ler o arquivo XML: $e');
      print('Erro ao ler o arquivo XML: $s');
    }
    return [];
  }
}
