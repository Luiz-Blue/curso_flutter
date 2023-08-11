import 'package:flutter/material.dart';
import 'cadastro.dart';

class EdicaoDeProduto extends StatefulWidget {
  final Produtos produtu;

  EdicaoDeProduto({required this.produtu});

  @override
  _EdicaoDeProdutoState createState() => _EdicaoDeProdutoState();
}

class _EdicaoDeProdutoState extends State<EdicaoDeProduto> {
  late TextEditingController _nomeController;
  late TextEditingController _descricaoController;
  late TextEditingController _precoController;
  late TextEditingController _quantidadeController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.produtu.nome);
    _descricaoController =
        TextEditingController(text: widget.produtu.descricao);
    _precoController =
        TextEditingController(text: widget.produtu.preco.toString());
    _quantidadeController =
        TextEditingController(text: widget.produtu.quantidade.toString());
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    _precoController.dispose();
    _quantidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Produto'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome do Produto',
                  border: OutlineInputBorder(), 
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  labelStyle: TextStyle(color: Colors.green),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(
                  labelText: 'Descrição do Produto',
                  border: OutlineInputBorder(), 
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  labelStyle: TextStyle(color: Colors.green),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _precoController,
                decoration: InputDecoration(
                  labelText: 'Preço do Produto (R\$)',
                  border: OutlineInputBorder(), 
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  labelStyle: TextStyle(color: Colors.green),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _quantidadeController,
                decoration: InputDecoration(
                  labelText: 'Quantidade de Produtos',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  labelStyle: TextStyle(color: Colors.green),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  widget.produtu.nome = _nomeController.text;
                  widget.produtu.descricao = _descricaoController.text;
                  widget.produtu.preco = double.parse(_precoController.text);
                  widget.produtu.quantidade =
                      int.parse(_quantidadeController.text);

                  Navigator.pop(context, widget.produtu);
                },
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Text('Salvar Alterações',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}