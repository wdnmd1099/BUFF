import 'package:flutter/material.dart';

class CheckmarkAnimation extends StatefulWidget {
  @override
  _CheckmarkAnimationState createState() => _CheckmarkAnimationState();
}

class _CheckmarkAnimationState extends State<CheckmarkAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _circleAnimation;
  late Animation<double> _checkAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    _circleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _checkAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 动画完成后执行其他操作
        // 比如导航到下一个页面
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return CustomPaint(
          painter:
              _CheckmarkPainter(_circleAnimation.value, _checkAnimation.value),
          size: Size(200.0, 200.0),
        );
      },
    );
  }
}

class _CheckmarkPainter extends CustomPainter {
  final double circleProgress;
  final double checkProgress;

  _CheckmarkPainter(this.circleProgress, this.checkProgress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    double radius = size.width / 2;
    double startAngle = -90.0; // 3点钟方向

    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
      startAngle,
      360 * circleProgress,
      true  ,
      circlePaint,
    );

    if (checkProgress > 0) {
      Paint checkPaint = Paint()
        ..color = Colors.blue
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;

      double checkLength = radius * 0.6;
      double checkStartX = size.width * 0.5 - checkLength;
      double checkStartY = size.height * 0.5;
      double checkEndX = size.width * 0.5;
      double checkEndY = size.height * 0.5 + checkLength;

      double currentCheckX =
          checkStartX + (checkEndX - checkStartX) * checkProgress;
      double currentCheckY =
          checkStartY + (checkEndY - checkStartY) * checkProgress;

      canvas.drawLine(
        Offset(checkStartX, checkStartY),
        Offset(currentCheckX, currentCheckY),
        checkPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_CheckmarkPainter oldDelegate) {
    return oldDelegate.circleProgress != circleProgress ||
        oldDelegate.checkProgress != checkProgress;
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('检查动画'),
      ),
      body: Center(
        child: CheckmarkAnimation(),
      ),
    ),
  ));
}
