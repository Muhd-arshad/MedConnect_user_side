import 'package:flutter/material.dart';
class LoadingController extends ChangeNotifier {
  bool _isLoading = false;
bool loading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
