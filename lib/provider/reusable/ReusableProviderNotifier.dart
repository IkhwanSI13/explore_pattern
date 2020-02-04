import 'package:flutter/foundation.dart';

class ReusableProviderNotifier with ChangeNotifier {
  int count = 0;

  add() {
    count++;
    notifyListeners();
  }

  remove() {
    count--;
    notifyListeners();
  }
}
