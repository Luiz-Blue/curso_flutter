import 'package:flutter/material.dart';
import 'tela1.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: lobby(),
    );
  }
}