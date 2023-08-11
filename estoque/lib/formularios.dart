import 'package:flutter/material.dart';
import 'cadastro.dart';

class Estatistica extends StatefulWidget {
  final List<Produtos> produtos;

  Estatistica({required this.produtos});

  @override
  _EstatisticaState createState() => _EstatisticaState();
}

class _EstatisticaState extends State<Estatistica> {
  bool showProdutosComEstoqueBaixo = false;

  @override
  Widget build(BuildContext context) {
    int totalQuantidade = 0;
    double totalPreco = 0.0;
    List<Produtos> produtosComEstoqueBaixo = [];



    for (var produto in widget.produtos) {
      totalQuantidade += produto.quantidade;
      totalPreco += produto.preco;

      if (produto.quantidade < 5) {
        produtosComEstoqueBaixo.add(produto);
      }
    }

    bool hasProdutosComEstoqueBaixo = produtosComEstoqueBaixo.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text('Estatisticas'),
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.grey, 
                    ),
                    Text(
                      ' Quantidade total de produtos:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  '$totalQuantidade',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.grey,
                    ),
                    Text(
                      ' Total de preço dos produtos:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  'R\$ $totalPreco',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showProdutosComEstoqueBaixo = !showProdutosComEstoqueBaixo;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          hasProdutosComEstoqueBaixo ? Icons.error : Icons.check_circle,
                          color: hasProdutosComEstoqueBaixo ? Colors.red : Colors.grey, 
                        ),
                        Text(
                          ' Produtos com Estoque Baixo',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Icon(showProdutosComEstoqueBaixo ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                  if (showProdutosComEstoqueBaixo)
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: produtosComEstoqueBaixo.length,
                      itemBuilder: (context, index) {
                        var produto = produtosComEstoqueBaixo[index];
                        return ListTile(
                          title: Text(produto.nome),
                          subtitle: Text('Quantidade: ${produto.quantidade}'),
                        );
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}