import 'package:flutter/foundation.dart';

class ProviderNotifier with ChangeNotifier {
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
