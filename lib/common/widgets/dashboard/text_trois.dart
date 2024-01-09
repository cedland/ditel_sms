import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
class TextTrois extends StatelessWidget {
  const TextTrois({
    super.key, required this.text, required this.color, this.onPressed, this.icon, this.additionalicon, this.color2, required this.text2, required this.text3,
  });
  final String text;
  final String text2;
  final String text3;
  final Color color;
  final Color? color2;
  //final
  final VoidCallback? onPressed;
  final IconData? icon;
  final Function()? additionalicon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                            fontWeight:
                            FontWeight.bold,
                            color: color,
                            fontSize: 16,
                            fontFamily: "LatoBold"
                          ),
                        ),
                         Text(
                         text2,
                          style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                          color:color2,
                          fontSize: 13,
                              fontFamily: "LatoRegular"
                         ),
                         ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          //width: 130,
          width: 120,
          child: Row(
            children: [
              IconButton(color: color2, onPressed:onPressed, icon: Icon(icon),iconSize: 15,hoverColor: TColors.bg,),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(text3, style: Theme.of(context).textTheme.bodySmall!.copyWith(color:color2, fontSize: 12,fontFamily: "LatoRegular"),),
              ),
            ]
          ),
        )
      ],
    );
  }
}