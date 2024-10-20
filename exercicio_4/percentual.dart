class Estado {
  String sigla;
  double valor;
  double? porcentagem;

  Estado(this.sigla, this.valor);

  void definePorcentagem(double totalDistribuidora) {
    porcentagem = valor * 100 / totalDistribuidora;
  }
}

void main() {
  // Desta forma se aumentar os representantes o código irpa continuar funcionando
  List<Estado> estadosDistribuidora = [
    Estado("SP", 67836.43),
    Estado("RJ", 36678.66),
    Estado("MG", 29229.88),
    Estado("ES", 27165.48),
    Estado("Outros", 19849.53),
  ];

  double totalDistribuidora = estadosDistribuidora
      .map((estado) => estado.valor)
      .reduce((f1, f2) => f1 + f2);

  estadosDistribuidora.forEach((estado) {
    estado.definePorcentagem(totalDistribuidora);

    print(
        "Estado: ${estado.sigla}, Porcenagem: ${estado.porcentagem!.toStringAsFixed(2)}%");
  });
}
