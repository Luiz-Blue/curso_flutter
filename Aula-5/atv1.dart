import 'dart:async';

  Future<String> fetchData() async{
    await Future.delayed(Duration(seconds: 3));
    return 'dados obtidos';
   
  }

Future<void> main() async {

 fetchData().then((fetchData){print(fetchData);}); 
  print('aguarde 3 segundos');
  
}
