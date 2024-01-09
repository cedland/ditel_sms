import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key, required this.onPressed, required this.text, required this.width,
  });
  final VoidCallback onPressed;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color:TColors.bg,
      width: width,
      height: 19,
      child: Center(
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: TColors.colorCheckbox,
          ),child: Text(text, style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 14,
            color: TColors.bgboutton, fontWeight: FontWeight.w500,fontFamily: "LatoBold")),
        ),
      ),
    );
  }
}
