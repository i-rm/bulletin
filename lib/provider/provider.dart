import 'dart:async';

import 'package:flutter/material.dart';

class CheckProvider extends ChangeNotifier {
  int _checkedNum = 0;
  int get checkedNum => _checkedNum;

  Future<bool> setChecked(int c) async {
    _checkedNum = c;
    notifyListeners();
    await Future.delayed(Duration(milliseconds: 1000));
    return true;
  }

  Future<bool> setCheckedWithTimer(int c) async {
    await new Future.delayed(const Duration(milliseconds: 100));
    _checkedNum = c;
    notifyListeners();
    return true;
  }
}
