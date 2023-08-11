import 'package:flutter/material.dart';

class Produtos {
  String nome;
  String descricao;
  double preco;
  int quantidade;

  static var isEmpty;

  Produtos({
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.quantidade,
  });
}

class Registracao extends StatefulWidget {
  @override
  _ProductRegistrationScreenState createState() =>
      _ProductRegistrationScreenState();
}

InputDecoration buildInputDecoration(String labelText) {
  return InputDecoration(
    labelText: labelText,
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.green),
    ),
  );
}

class _ProductRegistrationScreenState extends State<Registracao> {
  final _formKey = GlobalKey<FormState>();
  late String _nomeDoProduto;
  late String _descricaoP;
  late double _precoDoProduto;
  late int _quantidadeP;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16.0),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: buildInputDecoration('Nome do Produto'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obrigatório';
                  }
                  return null;
                },
                onSaved: (value) => _nomeDoProduto = value!,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: buildInputDecoration('Descrição do Produto'),
                maxLines: 3,
                onSaved: (value) => _descricaoP = value!,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: buildInputDecoration('Preço do Produto (R\$)'),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  final double parsedValue = double.tryParse(value) ?? -1;
                  if (parsedValue <= 0) {
                    return 'O preço deve ser maior que zero';
                  }
                  return null;
                },
                onSaved: (value) => _precoDoProduto = double.parse(value!),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: buildInputDecoration('Quantidade de Produtos'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  final int parsedValue = int.tryParse(value) ?? -1;
                  if (parsedValue < 0) {
                    return 'A quantidade não pode ser negativa';
                  }
                  return null;
                },
                onSaved: (value) => _quantidadeP = int.parse(value!),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    Produtos novoProduto = Produtos(
                      nome: _nomeDoProduto,
                      descricao: _descricaoP,
                      preco: _precoDoProduto,
                      quantidade: _quantidadeP,
                    );

                    Navigator.pop(context, novoProduto);
                  }
                },
                child: Text(
                  'Salvar',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
