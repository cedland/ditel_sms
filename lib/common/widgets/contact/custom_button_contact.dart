import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CustomButtonContact extends StatelessWidget {
  const CustomButtonContact({super.key, required this.text, required this.onPressed, required this.width, required this.taille});

  final String text;
  final VoidCallback onPressed;
  final double width;
  final double taille;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
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
                .copyWith(fontWeight: FontWeight.w500, fontSize: taille, color: TColors.bg)
        ),
      ),
    );
  }
}
