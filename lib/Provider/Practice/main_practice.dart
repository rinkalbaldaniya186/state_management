import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Provider/Practice/image_class.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ChangeNotifierProvider(
        create: (context) => Pic(false,false, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFEnY2Lamn4o8QAd01sENEvpWBDci9AZ0hLQ&s'),
        child: Homepage(),
      )
    );
  }
}
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
        backgroundColor: Colors.lightBlue.shade200,
        toolbarHeight: 70,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Consumer<Pic>(
                builder: (context, pic, child) {
                  return Container(
                    // color: Colors.grey,
                    height: 500,
                    width: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(pic.image),
                          fit: BoxFit.fitHeight
                      ),
                    ),
                  );
                }
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<Pic>(
                        builder: (context, pic, child) {
                          return  IconButton(
                            onPressed: () {
                              pic.toggleColorF();  // Toggle color via ColorNotifier
                            },
                            icon: Icon(Icons.favorite),
                            tooltip: 'Like',
                            iconSize: 40,
                            color: pic.isRedF ? Colors.red : Colors.grey,  // Update color reactively
                          );
                        },
                      ),
                      Consumer<Pic>(
                        builder: (context, pic, child) {
                          return  IconButton(
                            onPressed: () {
                              pic.toggleColorS();  // Toggle color via ColorNotifier
                            },
                            icon: Icon(Icons.star),
                            tooltip: 'Favorite',
                            iconSize: 40,
                            color: pic.isRedS ? Colors.red : Colors.grey,  // Update color reactively
                          );
                        },
                        child: Text('Hii'),
                      ),
                    ],
                  ),
                  OutlinedButton(
                      onPressed: () {
                        Provider.of<Pic>(context, listen: false).imagechange(getRandomName());
                      },
                      child: Text('Next', style: TextStyle(color: Colors.black, fontSize: 22,),)
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}

dynamic getRandomName() {
  var nameList = [
    'https://i.pinimg.com/736x/76/f0/7c/76f07cf03b32dd691f58bae9f223092c.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxZSWOIQsD7VFeGhEwRK28j8RNvg4iSTkFw&s',
    'https://i.pinimg.com/736x/04/45/56/044556c51da118c4e12f88268c8727b1.jpg',
    'https://i.pinimg.com/236x/d5/0e/7a/d50e7aabed46c5fe25218924cd04055c.jpg',
    'https://i.pinimg.com/736x/a6/bd/3b/a6bd3bf8f73fd1771cd08e66e3038920.jpg',
    'https://i.pinimg.com/236x/93/fd/6f/93fd6fa480c727ea181c4ef1179833af.jpg',
    'https://e0.pxfuel.com/wallpapers/941/339/desktop-wallpaper-radha-krishna-serial-radha-krishna-cute.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIHxyazVySrYbcuP8foymxfa2nwJEkUK4z0A&s',
    'https://i.pinimg.com/736x/1b/2b/35/1b2b35f6cfdaf62036fbc24b58589a18.jpg',
    'https://i.pinimg.com/originals/e2/95/0e/e2950e4d14fed6c91b5698a1eebb64e3.jpg',
    'https://i.pinimg.com/236x/fe/a4/27/fea427fd4d5bc7272ea4dd05877baf63.jpg'
  ];
  var index = Random().nextInt(nameList.length);
  return nameList[index];

}