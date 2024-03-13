import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreenViewModel with ChangeNotifier {
  bool _loading = true;
  get loading => _loading;
  void initialize() async {
    Timer(const Duration(seconds: 10), () {
      _loading = false;

      notifyListeners();
    });
  }
}
