import 'package:flutter/foundation.dart';

class ConsumerNotifier with ChangeNotifier {
  int countConsumer = 0;
  int countSelector = 0;

  addConsumer() {
    countConsumer++;
    notifyListeners();
  }

  removeConsumer() {
    countConsumer--;
    notifyListeners();
  }

  addSelector() {
    countSelector++;
    notifyListeners();
  }

  removeSelector() {
    countSelector--;
    notifyListeners();
  }

  int get getSelector => countSelector;
}
