import 'dart:io';

void main() {
  print("Digite o preço máximo: ");
  double precoMax = double.parse(stdin.readLineSync()!);

  var listaPrecos = listaPrecosProduto(precoMax);

  listaPrecos.forEach((preco)=> print(preco.toStringAsFixed(2)));
}

List<double> listaPrecosProduto(double precoMax) {
  List<double> listaPrecos = [];
  for (var preco = 0.0; preco <= precoMax; preco + 0.01) {
    listaPrecos.add(preco);
  }
  return listaPrecos;
}