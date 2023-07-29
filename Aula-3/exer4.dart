void listaNotas(List<double> notas) {
  if (notas.isEmpty) return 0.0;

  double soma = 0.0;
  for (var nota in notas) {
    soma += nota;
  }
  
}
