import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CirclePageRoute extends PageRoute {
  CirclePageRoute({
    required this.builder,
    required this.cX,
    required this.cY,
    this.transitionDuration = const Duration(milliseconds: 350),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor = Colors.transparent,
    this.barrierLabel = '',
    this.maintainState = true,

  });

  double cX ;
  double cY ;


  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return ClipPath(
          clipper: CirclePath(cX: cX,cY: cY,value: animation.value ),
          child: child,
        );
      },
      child: builder(context),
    );
  }
}

class CirclePath extends CustomClipper<Path> {
  CirclePath({required this.cX,required this.cY,required this.value});

  final double value;
  final double cX ;
  final double cY ;

  @override
  Path getClip(Size size) {
    var path = Path();
    double radius =
    // sqrt这里算的是屏幕对角线的长度 value是 从0至1的小数递增 所以乘 value 就计算出当前圆的半径
    value * sqrt(size.height * size.height + size.width * size.width);
    path.addOval(Rect.fromLTRB(
        cX - radius, cY -radius, cX + radius, cY+ radius));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}