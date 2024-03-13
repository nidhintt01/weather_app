import 'package:flutter/material.dart';


class TextWidget extends StatelessWidget {
  final String data;

  final TextStyle style;

  TextWidget({required this.data, required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(data, style: style);
  }
}
