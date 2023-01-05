import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class CountProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void setcounter() {
    _count++;
    notifyListeners();
  }
}
