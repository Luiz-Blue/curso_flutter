import 'package:flutter/material.dart';

void main() {
  
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});
 final Map<String, List<String>> dados = {
    'Aperitivos': [
      'Bolinhos de queijo',
      'Bruschetta de tomate com majericão',
      'Canapés de salmão com cream cheese'
    ],
    'Pratos Principais':[
      'Frango assado com batatas',
      'Espaguete à bolinhesa',
      'Risoto de cogumelos',
    ],
    'Sobremesas':[
      'Torta de maça',
      'Mousse de chocolate',
      'Pudim de leite', 
    ],
  };
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Minhas Receitas',
      // theme:ThemeData.(prim) ,
        home: Scaffold(
          appBar: AppBar(
            title: Text
              ('Minhas Receitas')
              ),
                body: Column(
                  mainAxisAlignment:MainAxisAlignment.start ,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  Center(child: Text(dados.entries.first.key, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)),
                  for(String elemento in dados.entries.first.value) Text(elemento),
                 
                  Center(child: Text(dados.entries.elementAt(2).key,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24))),
                  for(String elemento in dados.entries.elementAt(2).value) Text(elemento),
                 
                  Center(child: Text(dados.entries.last.key,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24))),
                  for(String elemento in dados.entries.last.value) Text(elemento),
                
                  ],
                ),
              floatingActionButton: FloatingActionButton(
                child: Text("Algo"),
                onPressed: null),
              ),
  
    );
  }
}

              // floatingActionButton: FloatingActionButton(onPressed: null),

