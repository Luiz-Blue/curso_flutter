import 'dart:math';
import 'dart:io';

void main() {
  int intValue = Random().nextInt(10) + 1;
  //print(intValue);

  int tentativas = 0;
  int limite = 5;

  print('advinhe o numero: ');

  int numero = int.parse(stdin.readLineSync()!);

  while (tentativas < limite) {
    print('advinhe o numero: ');
    numero = int.parse(stdin.readLineSync()!);

    tentativas++;
    if (intValue < numero) {
      print('numero errado tente um valor maior');
    } else if (intValue > numero) {
      print('numero errado tente um valor menor');
    } else {
      print('parabens voce acertou');
      break;
    }
  }
}
