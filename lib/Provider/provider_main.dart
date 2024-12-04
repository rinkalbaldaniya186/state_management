import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Provider/counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Provider',
      /*home: Provider(
        create: (context) => Counter(),
        child: CounterPage(),
      ),*/
      home: ChangeNotifierProvider(
        create: (context) => Counter(),
        child: CounterPage(),
      )
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  @override
  Widget build(BuildContext context) {
    print('build method called');

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Provider.of<Counter>(context, listen: false).decrement();
                  },
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text(
                  '${Provider.of<Counter>(context).count}',
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<Counter>(context, listen: false).increment();
                  },
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}