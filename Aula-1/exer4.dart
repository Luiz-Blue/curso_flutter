import 'dart:math';

void main() {
  String pesoBalaca = '80';
  // print(pesoBalaca);
  int? pesoAtual = int.tryParse(pesoBalaca);
  //print(pesoBalaca);

  print(pesoAtual!.round());

  if (pesoAtual > 70) {
    print(pesoAtual * -1);
  }
  print(pesoAtual.abs());
}
