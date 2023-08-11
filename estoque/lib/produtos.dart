import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'edicao.dart';
import 'formularios.dart';

class ProdutosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MeusProdutos(),
    );
  }
}

class MeusProdutos extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<MeusProdutos> {
  List<Produtos> produtos = [];

  void _navigateToEstatistica() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Estatistica(produtos: produtos),
      ),
    );
  }

  void _navigateToAdicionarProdutos() async {
    final novo = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Registracao()),
    );
    if (novo != null) {
      setState(() {
        produtos.add(novo);
      });
    }
  }

  void _editor(int index) async {
    final editar = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EdicaoDeProduto(produtu: produtos[index]),
      ),
    );
    if (editar != null) {
      setState(() {
        produtos[index] = editar;
      });
    }
  }

  void _deleteProduct(int index) {
    setState(() {
      produtos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Meus Produtos'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
          ),
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              icon: Icon(Icons.dashboard_outlined),
              onPressed: _navigateToEstatistica,
            ),
          ]),
      body: produtos.isEmpty
          ? Center(
              child: Text('Nenhum produto cadastrado.'),
            )
          : ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          leading: Icon(Icons.shopping_bag),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                produtos[index].nome,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                'R\$ ${produtos[index].preco.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.green,
                                ),
                              ),
                              Row(
                                children: [
                                   IconButton(
                                  icon: Icon(Icons.remove, color:  Color.fromARGB(133, 214, 6, 6)),
                                  onPressed: () {
                                    setState(() {
                                      produtos[index].quantidade--;
                                    });
                                  },
                              ),
                              Text(
                                'Quantidade: ${produtos[index].quantidade}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: produtos[index].quantidade< 5? Colors.red: null,
                                ),
                              ),
                                IconButton(
                                  icon: Icon(Icons.add,
                                      color: Color.fromARGB(255, 0, 222, 7)),
                                  onPressed: () {
                                    setState(() {
                                      produtos[index].quantidade++;
                                    });
                                   },
                                 ),
                               ],
                              )                          
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.grey),
                              onPressed: () => _editor(index),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteProduct(index),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAdicionarProdutos,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
