import 'package:flutter/material.dart';

class ProgressNotifier extends ChangeNotifier {
  double _progress = 0;

  double get progress => _progress;

  void updateProgress(double newProgress) {
    _progress = newProgress;
    notifyListeners();
  }
}
