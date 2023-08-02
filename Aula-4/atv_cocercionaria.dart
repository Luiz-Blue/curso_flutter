void main() { 
  Carro ford = Carro(
    marca : 'ford' ,
    modelo : 'S.U.V',
    fabricacao : 2019,
    km : 220,
    porta : 4,
    valor : (0.01 * 220) * (4 * 1000),
    base : 10000,
  );
  ford.getdadosC();
  print (ford.calculo_final(10000));
  print(ford.valor.toStringAsFixed(2));
  
  Moto honda = Moto(
    marca : 'honda' ,
    modelo : 'CG',
    fabricacao : 2020,
    celindrada : 320.3,
    partida : 49,
    valor : (0.05 * 49) * ( 49 * 500 ),
    base : 8000,
  );
  honda.getdadosM();
  print (honda.calculo_final(8000));
  print(honda.valor.toStringAsFixed(2));
}
class Carro{
  String marca ;
  String modelo ;
  int fabricacao;
  double km;
  int porta;
  double valor;
  double base;
  Carro({
    required this.marca,
    required this.modelo,
    required this.fabricacao,
    required this.km,
    required this.porta,
    required this.valor,
    required this.base,
  
  });
  double calculo_final(double base ){
    return valor + base;
  }
void getdadosC(){
  print('$marca, $modelo, $fabricacao, saindo por apenas ');
}
}

class Moto{
  String marca ;
  String modelo ;
  int fabricacao;
  double celindrada;
  int partida;
  double valor;
  double base;
  
  Moto({
    required this.marca,
    required this.modelo,
    required this.fabricacao,
    required this.celindrada,
    required this.partida,
    required this.valor,
    required this.base,
  });
  double calculo_final(double base ){
    return valor + base;
  }
void getdadosM(){
  print('$marca, $modelo, $fabricacao, saindo por apenas $valor R\$');
 
}
}