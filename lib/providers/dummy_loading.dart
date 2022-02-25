import 'package:flutter/foundation.dart';

class DummyLoading with ChangeNotifier {
  bool _isLoaded = false;
  //gettr
  bool get isLoaded => _isLoaded;

  //setter
  onRefresh() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      _isLoaded = true;
      notifyListeners();
    });
  }
}
