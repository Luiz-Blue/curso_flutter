 import 'dart:io';

void main() {
  print ('informe o valor do produto');
    double Produtos = double.parse(stdin.readLineSync()!);

   print ('informe a porcentagem do seu desconto');
    double Porcentagem = double.parse(stdin.readLineSync()!);
  
  var Descontos = (double Produto, double Desconto)=> Produto - (Produto* Desconto/100 );

  print ('e com o seu desconto de $Porcentagem % , o produto sairá por apenas ${(Descontos (Produtos, Porcentagem ))} ');
  
}