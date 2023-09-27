import 'package:flutter/material.dart';

class T3 extends StatefulWidget {
  const T3({super.key});

  @override
  State<T3> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<T3> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return Container(
      height: maxHeight,
      width: maxWidth,
      color: Colors.grey,
      child: Text('shit'),
    );
  }
}