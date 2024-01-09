import 'package:flutter/material.dart';
class TextPrincipal extends StatelessWidget {
  const TextPrincipal({
    super.key, required this.text, required this.color,
  });
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(
            color: color,
            fontSize: 26,
        fontFamily: "LatoBold"));
  }
}