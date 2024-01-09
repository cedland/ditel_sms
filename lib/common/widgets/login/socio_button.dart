import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class SocioButton extends StatelessWidget {
  const SocioButton({super.key, required this.text, required this.onPressed, required this.image});

  final String text;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              foregroundColor: TColors.white,
              side: const BorderSide(
                width: 1,
                color: Color.fromARGB(255, 236, 238, 245),
                style: BorderStyle.solid,
              ),
              fixedSize: const Size(350, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size(420, 50),
            ),
            child: Row(
              children: [
                SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset(image)
                ),
                const VerticalDivider(
                  thickness: 0,
                  color: Color.fromARGB(255, 238, 238, 238),
                ),
                Text(
                    text,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 16,
                        color: TColors.subtitle,fontWeight: FontWeight.w400)
                ),
              ],
            ),
          ),
    );
  }
}
