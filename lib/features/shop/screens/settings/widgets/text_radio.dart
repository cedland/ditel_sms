import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
class TextRadio extends StatelessWidget {
  const TextRadio({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: Theme.of(context)
        .textTheme
        .bodySmall!
        .copyWith(
        color: TColors.title,
       fontFamily: "LatoBold",
        fontSize: 13),);
  }
}