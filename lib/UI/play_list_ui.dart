import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:state_management/UI/customContainer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: MyUiPage(),
    );
  }
}
class MyUiPage extends StatefulWidget {
  const MyUiPage({super.key});

  @override
  State<MyUiPage> createState() => _MyUiPageState();
}

class _MyUiPageState extends State<MyUiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomContainer(
                    height: 60,
                    width: 60,
                    child: Icon(Icons.arrow_back),
                  ),
                  Text(
                      "P L A Y I S T",
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  CustomContainer(
                    height: 60,
                    width: 60,
                    child: Icon(Icons.menu),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              CustomContainer(
                  child: Column(
                    children: [
                      Image.network('https://c.saavncdn.com/494/Best-Indian-Lofi-All-Time-Hits-Vol-2-Hindi-2023-20230616114022-500x500.jpg'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "LOFI SONG",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18
                                ),
                              ),
                              Text(
                                "Kesariya",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              )
                            ],
                          ),
                          Icon(Icons.favorite, size: 32, color: Colors.red,)
                        ],
                      ),
                    ],
                  ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("0:00", style: TextStyle(fontSize: 22),),
                  Icon(Icons.shuffle, size: 26,),
                  Icon(Icons.repeat, size: 26,),
                  Text("4:22", style: TextStyle(fontSize: 22),),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              CustomContainer(
                child: LinearPercentIndicator(
                  // width: 140.0,
                  lineHeight: 10.0,
                  percent: 0.8,
                  backgroundColor: Colors.transparent,
                 progressColor: Colors.green,
               ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                        child: Icon(Icons.skip_previous, size: 34,),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 2,
                    child: CustomContainer(
                      child: Icon(Icons.play_arrow, size: 34,),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: CustomContainer(
                      child: Icon(Icons.skip_next_sharp, size: 34,),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

