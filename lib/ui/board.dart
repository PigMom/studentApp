import 'package:flutter/material.dart';

class Board extends StatefulWidget {

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("board"),
      ),
    );
  }
}

