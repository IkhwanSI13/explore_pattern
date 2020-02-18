import 'package:flutter/foundation.dart';

class Multi2Notifier with ChangeNotifier {
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
