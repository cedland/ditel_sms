import 'package:flutter/material.dart';
class TextSecond extends StatelessWidget {
  const TextSecond({
    super.key, required this.text, required this.color,
  });
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        //textAlign: TextAlign.start,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(
          color: color,
          fontSize: 14,
          fontFamily: "LatoRegular"
        ));
  }
}