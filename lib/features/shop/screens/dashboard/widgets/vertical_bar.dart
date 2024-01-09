import 'package:flutter/material.dart';
class VerticalBar extends StatelessWidget {
  final Color color;
  final double height;

  const VerticalBar({Key? key, required this.color, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3,
      height: height,
      color: color,
    );
  }
}