import 'package:flutter/material.dart';
import 'package:weather_app/model/data/assets.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(color: Colors.black),
        child: Image.asset(
          backgroundimage,
          fit: BoxFit.fill,
        ),
      ),
    ]);
  }
}
