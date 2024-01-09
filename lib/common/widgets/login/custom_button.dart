import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 420,
      height: 40,
      decoration: const BoxDecoration(
        color:  TColors.bgboutton,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          fixedSize: const Size(350, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w500, fontSize: 16, color: TColors.bg,fontFamily: "LatoBold")
        ),
      ),
    );
  }
}
