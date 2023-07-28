void main() {
  final Map<String, double> pesos = {};
  pesos["carol"] = 54.0;
  pesos["luiz"] = 79.7;
  pesos["angela"] = 67.9;
  pesos["fulano"] = 89.1;

  pesos.remove('carol');

  print(pesos);

  var pesoNovo = pesos['angela'];
  var pesoNovo2 = pesos['fulano'];

  print(pesoNovo);
  print(pesoNovo2);

  print(pesos);
}
