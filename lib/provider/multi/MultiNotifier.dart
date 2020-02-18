import 'package:flutter/foundation.dart';

class MultiNotifier with ChangeNotifier {
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
