import 'package:flutter/material.dart';

class Pic with ChangeNotifier {
  String image;
  bool isRedF = false;
  bool isRedS = false;

  Pic(this.isRedF,this.isRedS, {required this.image});

  void imagechange(String newImage) {
    this.image = newImage;
    notifyListeners();
  }

  void toggleColorF() {
    isRedF = !isRedF;
    notifyListeners();
  }

  void toggleColorS() {
    isRedS = !isRedS;
    notifyListeners();
  }

}
