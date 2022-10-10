import 'package:flutter/material.dart';

class HashTag extends StatefulWidget {
  const HashTag({Key? key}) : super(key: key);

  @override
  State<HashTag> createState() => _HashTagState();
}

class _HashTagState extends State<HashTag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("hashtag"),
      ),
    );
  }
}
