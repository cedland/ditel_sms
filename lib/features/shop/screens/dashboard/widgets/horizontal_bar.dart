import 'package:flutter/material.dart';
class HorizontalBar extends StatelessWidget {
  final Color color;
  final double width;

  const HorizontalBar({Key? key, required this.color, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 3,
      color: color,
    );
  }
}