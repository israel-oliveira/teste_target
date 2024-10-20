import 'dart:convert';
import 'dart:io';

import '../model/dia.dart';
import 'dia_repository_interface.dart';

class JsonDiaRepository extends DiaRepositoryInterface {
  @override
  Future<List<Dia>> getDias(String path) async {
    final file = File(path);
    try {
      String jsonFile = await file.readAsString();

      var jsonData = jsonDecode(jsonFile);

      List<Dia> dias = [];

      for (var json in jsonData) {
        Dia dia = Dia.fromJson(json);
        dias.add(dia);
      }
      return dias;
    } catch (e) {
      print('Erro ao ler o arquivo JSON: $e');
    }
    return [];
  }
}
