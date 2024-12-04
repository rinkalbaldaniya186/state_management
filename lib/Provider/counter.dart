// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Counter with ChangeNotifier{

  int count = 0;

  void increment(){
    count++;
    notifyListeners();
    print('count : $count');
  }

  void decrement(){
    count--;
    notifyListeners();
    print('count : $count');
  }

}