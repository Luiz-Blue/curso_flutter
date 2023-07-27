//CADASTRO DE ALUNO

void main() {
  String nome_aluno = ('luiz');

  int? idade = null;
  print('a idade de $nome_aluno é ${idade ?? 20}');

  bool entrou_recente = true;
  if (entrou_recente) {
    print('entrou recentemente');
  } else {
    print('não entrou recentemente');
  }

  double peso = 79.7;
  print('o peso do aluno é $peso');

  List<double> notas = [5.5, 7.8, 2.2, 6.0];
  print(
      'primeira nota, ${notas[0]},segunda nota, ${notas[1]},terceira nota, ${notas[2]},quarta nota, ${notas[3]},');

  List<String> materias = ['algebra', 'fisca', 'sistema', 'laboratorio'];
  print('as materias de $nome_aluno são $materias ');

  String endereco = ('Cidade Nova 8 Ananideua');
  print('o endereço de $nome_aluno e $endereco');
}
