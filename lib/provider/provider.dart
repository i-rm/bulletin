import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class CheckProvider extends ChangeNotifier {
  int _checkedNum = 0;
  int get checkedNum => _checkedNum;

  void setChecked(int c) {
    _checkedNum = c;
    notifyListeners();
  }

  // Future sleep() {
  //   return new Future.delayed(const Duration(seconds: 3), setFifth());
  // }

  void setFifth() {
    new Timer(const Duration(seconds: 1), () {
      _checkedNum = 5;
      notifyListeners();
    });
  }
}
