import 'package:flutter/foundation.dart';

class Employee with ChangeNotifier{
  String name;
  String department;
  int rank;

  Employee(this.name, this.department, this.rank);


  void updateName(String name){
    this.name = name;
    notifyListeners();
  }

  void increaseRank(){
    rank++;
    notifyListeners();
  }

}