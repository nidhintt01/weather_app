import 'package:flutter/material.dart';

class NoPermissionPage extends StatelessWidget {
  const NoPermissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Please Enable Location Permission",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
