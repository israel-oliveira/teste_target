void main() {
  String string = "ABCDEFG HIJKLM";
  List<String> resultado = [];

  List<String> lista = string.split("");

  for (int i = lista.length; i > 0; i--) {
    int index = i - 1;
    resultado.add(lista[index]);
  }

  print(resultado.join());
}
