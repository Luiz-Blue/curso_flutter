import 'dart:typed_data';

void main() {
  List<int> notas = [8, 7, 11];
  notas.add(10);
  notas.remove(11);
  print(notas);

  List<int> notas1Semestre = notas.sublist(0, 2);
  print(notas1Semestre);
  
  notas.sort(); //certo 
  print(notas);
}
