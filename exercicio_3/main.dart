import 'model/dia.dart';
import 'repository/dia_repository_interface.dart';
import 'repository/json_dia_repository.dart';
import 'repository/xml_dia_repository.dart';

DiaRepositoryInterface defineImplementacao(String tipo) {
  switch (tipo) {
    case "json":
      return JsonDiaRepository();
    case "xml":
      return XmlDiaRepository();
    default:
      throw Exception("Tipo de arquivo não definido");
  }
}

Future<List<Dia>> buscarDados(String path) async {
  DiaRepositoryInterface _diaRepository =
      defineImplementacao(path.split(".").last);
  return await _diaRepository.getDias(path);
}

void main() async {
  List<Dia> dias = await buscarDados("./repository/dados.json");

// Pega o dia com a maior venda no mes
  Dia diaMaiorVenda = dias.fold<Dia>(
      dias[0],
      (atual, proximo) =>
          ((atual.valor ?? 0.0) > (proximo.valor ?? 0.0)) ? atual : proximo);

// Limpa minha lista e deixa somete as que possui vendas
  List<Dia> diasSemFinaisDeSemana =
      dias.map((dia) => (dia.valor! > 0.0) ? dia : null).nonNulls.toList();

// pega o dis com a menor venda no mes
  Dia diaMenorVenda = diasSemFinaisDeSemana.fold<Dia>(
      diasSemFinaisDeSemana[0],
      (atual, proximo) =>
          ((atual.valor ?? 0.0) < (proximo.valor ?? 0.0)) ? atual : proximo);

// Define a média
  double media = diasSemFinaisDeSemana
          .map((dia) => dia.valor!)
          .reduce((dia, proximoDia) => dia + proximoDia) /
      diasSemFinaisDeSemana.length;

// Pega os dias a cima de média
  List<Dia> diasAcimaDaMedia = diasSemFinaisDeSemana
      .map((dia) => dia.valor! > media ? dia : null)
      .nonNulls
      .toList();

  print(
      "Maior faturamento do mês foi dia ${diaMaiorVenda.dia} e o valor faturado foi de R\$ ${diaMaiorVenda.valor!.toStringAsFixed(2).replaceAll(".", ",")}");
  print(
      "Menor faturamento do mês foi dia ${diaMenorVenda.dia} e o valor faturado foi de R\$ ${diaMenorVenda.valor!.toStringAsFixed(2).replaceAll(".", ",")}");

  print(
      "Este mês teve ${diasAcimaDaMedia.length} dias a cima da media:  (Media: R\$ ${media.toStringAsFixed(2).replaceAll(".", ",")})");
  diasAcimaDaMedia.forEach((dia) => print(
      "Dia: ${dia.dia}, Valor: R\$ ${dia.valor!.toStringAsFixed(2).replaceAll(".", ",")}"));
}
