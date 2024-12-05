import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {

  double? height;
  double? width;
  Widget child;

  CustomContainer({this.height, this.width, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: child,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade700, blurRadius: 15, offset: Offset(5, 5)),
            BoxShadow(color: Colors.white, blurRadius: 15, offset: Offset(-5, -5))
          ]
      ),
    );
  }
}
