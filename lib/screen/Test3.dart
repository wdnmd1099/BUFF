import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Circle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedCirclePage(),
    );
  }
}

class AnimatedCirclePage extends StatefulWidget {
  @override
  _AnimatedCirclePageState createState() => _AnimatedCirclePageState();
}

class _AnimatedCirclePageState extends State<AnimatedCirclePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0 , end: pi * 2).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        print('wancheng');
        // _controller.reverse();
      }
    });
    print(_animation.value);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Circle'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          child: CustomPaint(
            painter: CirclePainter(_animation.value),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double angle;

  CirclePainter(this.angle);

  @override
  void paint(Canvas canvas, Size size) {
    print( angle);
    final double radius = min(size.width, size.height) / 2; //获取半径
    final Offset center = Offset(size.width / 2, size.height / 2); //获取圆心
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    double startAngle = -pi * 2; // 从三点钟方向开始
    double sweepAngle = angle;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate.angle != angle;
  }
}
