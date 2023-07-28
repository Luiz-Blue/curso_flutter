import 'dart:math';

Future<String> regressiveCount() async {
  for (int i = 10; i >= 1; i--) {
    print('lançamento em $i');
    await Future.delayed(Duration(seconds: 1));
  }
  return 'foguete lançado';
}

void main() {
  regressiveCount().then((value) => print("$value"));

}
