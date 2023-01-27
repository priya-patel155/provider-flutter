import 'package:flutter/foundation.dart';

class favourite extends ChangeNotifier {
  List<int> _selected = [];
  List<int> get selecteditem => _selected;

  void addItem(int item) {
    _selected.add(item);

    notifyListeners();
  }

  void removeItem(int index) {
    _selected.remove(index);
    notifyListeners();
  }
}
