import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Jogo da Velha'),
        ),
        body: GameBoard(),
      ),
    );
  }
}

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));

  String proxJogador = 'X';
  String vitorioso = '';
  bool empate = false;

  void _onButtonPressed(int row, int col) {
    if (board[row][col] == '' && vitorioso == '' && !empate) {
      setState(() {
        board[row][col] = proxJogador;
        if (_checkWin(row, col)) {
          vitorioso = proxJogador;
        } else {
          if (_tabuleiroCompleto()) {
            empate = true;
          } else {
            proxJogador = (proxJogador == 'X') ? 'O' : 'X';
          }
        }
      });
    }
  }

  bool _checkWin(int row, int col) {
    String symbol = board[row][col];

    if (board[row].every((cell) => cell == symbol)) {
      return true;
    }
    if (board.every((row) => row[col] == symbol)) {
      return true;
    }

    if ((board[0][0] == symbol &&
            board[1][1] == symbol &&
            board[2][2] == symbol) ||
        (board[0][2] == symbol &&
            board[1][1] == symbol &&
            board[2][0] == symbol)) {
      return true;
    }
    return false;
  }

  bool _tabuleiroCompleto() {
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (board[row][col] == '') {
          return false;
        }
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    double telaOtimizada = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          (vitorioso.isNotEmpty)
              ? 'Vitória do jogador $vitorioso !'
              : (empate)
                  ? 'jogo empatado'
                  : 'Vez do jogador $proxJogador',
          style: TextStyle(fontSize: telaOtimizada * 20),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 300,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 9,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            int row = index ~/ 3;
            int col = index % 3;
            return GameButton(
              symbol: board[row][col],
              onPressed: () => _onButtonPressed(row, col),
                );
          },
          ),
        ),
      ],
      );
  }
}

class GameButton extends StatelessWidget {
  final String symbol;
  final VoidCallback onPressed;

  GameButton({required this.symbol, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color simboloColor = (symbol == 'X')
        ? const Color.fromARGB(255, 128, 22, 14)
        : const Color.fromARGB(255, 27, 255, 35);
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.all(20.0),
        ),
        child:
            Text(symbol, style: TextStyle(fontSize: 40, color: simboloColor)),
      ),
    );
  }
}