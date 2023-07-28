void main() {
  int nume = 25;
  if (nume > 10 && nume < 20) {
    print('condição verdadeira');
  } else {
    print('condição falsa');
  }
  if (nume == 0 || nume == 50) {
    print('condição verdadeira');
  } else {
    print('condição falsa');
  }

  if (nume != 100 || nume == 200) {
    print('condição verdadeira');
  } else {
    print('condição falsa');
  }

  int idade = 25;
  if (idade >= 18) {
    print('maior de idade ');
  } else {
    print('menor de idade');
  }
  int semana = 7;
  switch (semana) {
    case 1:
      print('segunda feira');
      break;

    case 2:
      print('terça feira');
      break;

    case 3:
      print('quarta feira');
      break;

    case 4:
      print('quinta feira');
      break;

    case 5:
      print('sexta feira');
      break;

    case 6:
      print('sabado');
      break;

    case 7:
      print('domingo');
      break;
  }
}
