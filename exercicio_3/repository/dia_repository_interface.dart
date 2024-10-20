import '../model/dia.dart';

abstract class DiaRepositoryInterface {
  Future<List<Dia>> getDias(String path);
}
