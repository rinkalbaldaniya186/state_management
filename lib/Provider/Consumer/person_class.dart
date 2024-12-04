import 'package:flutter/foundation.dart';

class Person with ChangeNotifier{

  String name;
  int age;

  Person({required this.name, required this.age});

  void grow(){
    age++;
    notifyListeners();
  }


  void updateName(String name){
    this.name = name;
    notifyListeners();
  }


}