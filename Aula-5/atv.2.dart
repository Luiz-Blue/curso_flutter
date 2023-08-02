import 'dart:async';

Stream<int> countDown(int max) async* {
  for (int i = max; i >= 1; i--) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
  }
}

void main() async {
  Stream<int> countDownStream = countDown(5);
  await for (int num in countDownStream) {
    print(num);
  }
}