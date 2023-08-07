import 'package:flutter/material.dart';

class lobby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: lobbyDoJogo(),
    );
  }
}

class lobbyDoJogo extends StatefulWidget {
  @override
  _GameSetupScreenState createState() => _GameSetupScreenState();
}

class _GameSetupScreenState extends State<lobbyDoJogo> {
  TextEditingController jogador1Nome = TextEditingController();
  TextEditingController jogador2Nome = TextEditingController();
  bool isPlayButtonEnabled = false;

  void _botaoInicio() {
    setState(() {
      isPlayButtonEnabled = jogador1Nome.text.isNotEmpty &&
          jogador2Nome.text.isNotEmpty;
    });
  }

  void _startGame() {
    if (isPlayButtonEnabled) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Jogo Da Velha')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: const  EdgeInsets.all(16.0),
             child: TextField(
              controller: jogador1Nome,
              onChanged: (_) => _botaoInicio(),
              decoration: InputDecoration(
                labelText: 'jogador 1',
                border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(padding: const  EdgeInsets.all(16.0),
            child: TextField(
              controller: jogador2Nome,
              onChanged: (_) => _botaoInicio(),
              decoration: InputDecoration(
                labelText: 'jogador 2',
                border: OutlineInputBorder(),
              ),
             ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _startGame,
              child: Text('começa o jogo'),
              style: ElevatedButton.styleFrom() ,
            ),
          ],
        ),
      ),
    );
  }
}



