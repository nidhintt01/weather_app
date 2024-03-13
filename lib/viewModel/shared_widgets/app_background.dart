import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/viewModel/shared_widgets/circle_container.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: CircleContainer(
              color: Color(0XFFf9afd1), height: 300, width: 300),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CircleContainer(
              color: Color(0XFFf9afd1), height: 300, width: 300),
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: CircleContainer(
                color: Color(0XFFf9afd1), height: 300, width: 300)),
        Align(
          alignment: Alignment.bottomCenter,
          child: CircleContainer(
              color: Color(0XFF8273de), height: 300, width: 300),
        ),
      ],
    );
  }
}
