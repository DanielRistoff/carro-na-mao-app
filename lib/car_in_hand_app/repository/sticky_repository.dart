import 'package:flutter/material.dart';

class StickyRepository extends ChangeNotifier {
  int _idStickyUpdate = 0;

  int get idStickyUpdate => _idStickyUpdate;

  setIdStickyUpdate(int id) {
    _idStickyUpdate = id;
    notifyListeners();
  }
}
