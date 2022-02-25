import 'package:flutter/foundation.dart';

class DummyLoading with ChangeNotifier {
  bool _isLoaded = false;
  Map _selectedMagazine = {};
  //gettr
  bool get isLoaded => _isLoaded;
  Map get selectedMagazine => _selectedMagazine;

  //setter
  onRefresh() {
    reset();
    Future.delayed(const Duration(milliseconds: 500), () {
      _isLoaded = true;
      notifyListeners();
    });
  }

  setSelectedMagazine(Map value) => _selectedMagazine = value;

//resset
  reset() {
    _isLoaded = false;
    notifyListeners();
  }
}
