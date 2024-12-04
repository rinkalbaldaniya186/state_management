import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Provider/Saprate_Consumer/employee_class.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consumer and Selector',
      home: ChangeNotifierProvider(
        create: (context) => Employee('abc', 'HR', 1),
        child: EmployeeScreen(),
      ),
    );
  }
}

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consumer and Selector'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<Employee>(
                builder: (context, employee, child) {
                  return Text('name : ${employee.name}');
                },
              ),
              Consumer<Employee>(
                builder: (context, employee, child) {
                  return Text('department : ${employee.department}');
                },
              ),
              Selector<Employee, int>(
                builder: (context, rank, child) {
                  return Text('rank : ${rank}');
                },
                selector: (context, employee) => employee.rank,
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<Employee>(context, listen: false)
                      .updateName(getRandomName());
                },
                child: Text('Update name'),
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<Employee>(context, listen: false).increaseRank();
                },
                child: Text('Update rank'),
              )
            ],
          )),
    );
  }

  String getRandomName() {
    var nameList = ['Puja', 'Neha', 'Ajay', 'Kavita', 'Jay'];
    var random = Random().nextInt(nameList.length);
    return nameList[random];
  }
}