import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({super.key, this.label, this.validator, this.icon, this.hintext, required this.width, required this.color, required this.controller, this.keyboardType,});

  final String? label;
  final String? validator;
  final IconData? icon;
  final String? hintext;
  final double width;
  final Color color;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      width: width,
      height: 70,
      child: TextFormField(
         controller: controller,
        keyboardType: keyboardType,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: TColors.title, fontSize: 12, fontFamily: 'LatoBold'),
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
                fontSize: 12),
            hintText: hintext,
            hintStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(
                color: TColors.txtbouttongreydark,
                fontFamily: "LatoLight",
                fontSize: 10),

          ),
          cursorColor: TColors.title,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return validator;
            }
            return null;
          },
        ),
    );
  }
}
