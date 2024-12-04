import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Provider/Consumer/person_class.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consumer Widget',
      home: ChangeNotifierProvider(
        create: (context) => Person(name: 'Rahul', age: 17),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    print('build method called');

    return Scaffold(
      appBar: AppBar(
        title: Text('Consumer Widget'),
      ),
      body: Center(
          child: Consumer<Person>(
            builder: (context, person, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text('name : ${Provider.of<Person>(context).name}'),
                  Text('name : ${person.name}'),
                  SizedBox(height: 16,),
                  // Text('age : ${Provider.of<Person>(context).age}'),
                  Text('age : ${person.age}'),
                  SizedBox(height: 16,),
                  ElevatedButton(onPressed: () {
                    Provider.of<Person>(context, listen: false).grow();
                  }, child: Text('Grow'),),
                  SizedBox(height: 16,),
                  ElevatedButton(onPressed: () {
                    Provider.of<Person>(context, listen: false).updateName(getRandomName());
                  }, child: Text('Update Name'),),
                ],
              );
            },
          )
      ),
    );
  }

  String getRandomName() {
    var nameList = ['Rahul', 'Sonal', 'Disha', 'Sabir', 'Parin', 'Megh'];
    var index = Random().nextInt(nameList.length);
    return nameList[index];
  }

}