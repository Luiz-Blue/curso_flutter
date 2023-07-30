import 'dart:math';
import 'dart:io';

void main() {
  List<double> notas = [];

  int i = 0;
  while (i <= 3) {
    print('informe as notas individualmente');
    var nota = double.parse(stdin.readLineSync()!);
    notas.add(nota);
    print(notas);
    i++;
  }
  calculoMedia(notas);
}

double calculoMedia(List<double> notas) {
  double soma = 0.0;
  for (var nota in notas) {
    soma += nota;
  }

  return soma / notas.length;
}
