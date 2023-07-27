//TIPOS PRIMITIVOS
void main() {
  String redacao =
      ('as mais melhores ferias da minha vida, ferias marvilhosas');
  print(redacao);
  print(redacao.contains('ferias'));

  final String requisitos = ('a redação deve possir de 10 à 100 caracteres ');

  print('a sua redação possui ${redacao.length} caracteres ');
  int caracteres = redacao.length;
  if (caracteres >= 10 && caracteres <= 100) {
    print('redação aceita');
  } else {
    print('redação invalida ');
  }

  print(redacao.replaceAll('mais melhores', 'melhores'));
}
