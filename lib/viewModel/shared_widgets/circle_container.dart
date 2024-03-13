import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final Color color;

  final double height;
  final double width;

  const CircleContainer(
      {super.key, required this.color, required this.height, required this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
