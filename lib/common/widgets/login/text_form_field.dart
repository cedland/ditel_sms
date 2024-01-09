import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({super.key, this.label, this.validator, this.icon, this.hintext, required this.width, required this.color,});

  final String? label;
  final String? validator;
  final IconData? icon;
  final String? hintext;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 60,
      child: TextFormField(
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: TColors.title, fontSize: 16, fontFamily: 'LatoBold'),
          decoration: InputDecoration(
            suffixIcon:  Icon(
              icon,
              size: 18,
              color: color,
            ),
            labelText: label,
            //hintText: "Start typing...",
            labelStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(
                color: TColors.subtitle,
                fontFamily: "LatoRegular",
                fontSize: 14),
            hintText: hintext,
            hintStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(
                color: TColors.txtbouttongreydark,
                fontFamily: "LatoLight",
                fontSize: 16),

          ),
          cursorColor: TColors.title,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return validator;
            }
            return null;
          },
          onSaved: (value) {
          },
        ),
    );
  }
}
