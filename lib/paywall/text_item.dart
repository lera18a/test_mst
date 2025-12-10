import 'package:flutter/material.dart';

class TextItem extends StatelessWidget {
  const TextItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    const String ok = '\u2705';
    return Text(
      "$ok $text",
      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
    );
  }
}
