import 'package:flutter/foundation.dart';

class DummyLoading with ChangeNotifier {
  bool _isLoaded = false;
  //gettr
  bool get isLoaded => _isLoaded;

  //setter
  onRefresh() {
    reset();
    Future.delayed(const Duration(milliseconds: 500), () {
      _isLoaded = true;
      notifyListeners();
    });
  }

  reset() {
    _isLoaded = false;
    notifyListeners();
  }
}
