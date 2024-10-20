bool verifyFibonacci(int numeroTeste) {
  int valorAnterior = 0, valorAtual = 1, valorCache = 0;

  while (valorAtual < numeroTeste) {
    valorCache = valorAtual;
    valorAtual = valorAtual + valorAnterior;
    valorAnterior = valorCache;
  }

  if (numeroTeste == valorAtual) {
    return true;
  }

  return false;
}

void main() {
  List<int> numTetse = [5, 13, 24, 55, 89, 34, 21, 22];

  for (var num in numTetse) {
    bool response = verifyFibonacci(num);

    print("O $num ${response ? "" : "não"} pertence a sequencia de fibonacci");
  }
}
