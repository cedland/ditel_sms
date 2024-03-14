import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class TextFormFieldPasswordWidget extends StatefulWidget {
  const TextFormFieldPasswordWidget({super.key, this.label, this.validator, this.hintext, required this.width, required this.color, required this.icon1, required this.icon2});

  final String? label;
  final String? validator;
  final IconData icon1;
  final IconData icon2;
  final String? hintext;
  final double width;
  final Color color;

  @override
  State<TextFormFieldPasswordWidget> createState() => _TextFormFieldPasswordWidgetState();
}

class _TextFormFieldPasswordWidgetState extends State<TextFormFieldPasswordWidget> {
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: 70,
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: TColors.title, fontSize: 12, fontFamily: 'LatoBold'),
        decoration: InputDecoration(
            suffixIcon:  InkWell(
              onTap: () {
                setState(() {
                  passToggle = !passToggle;
                });
              },
              child: Icon(passToggle ? widget.icon1 : widget.icon2,
                size: 18,
                color: widget.color,
              ),
            ),
            labelText: widget.label,
            //hintText: "Start typing...",
            labelStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(
                color: TColors.subtitle,
                fontSize: 12,fontFamily: 'LatoRegular'),
            hintText: widget.hintext,
            hintStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(
                color: TColors.txtbouttongreydark,
                fontSize: 10,
                fontFamily: 'LatoLight'
            )

        ),
        obscureText: passToggle,
        cursorColor: TColors.title,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return widget.validator;
          }
          return null;
        },
        onSaved: (value) {
        },
      ),
    );
  }
}
