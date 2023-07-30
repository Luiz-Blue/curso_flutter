void main(List<String> args) {
  List<String> nomes = ["claudia", "otavio", "edu"];

  var listNomes = retornaLista(nomes);

  print(listNomes);

  var result = soma(2, 2);
  print(result);
}

retornaLista(List<dynamic> list) {
  for (var x in list) {
    print(x);
  }

  for (int i = 0; i <= 10; i++) {
    print(i);
  }
}

int soma(int a, int b) => a + b;
