import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
class TextTroisDashbord2 extends StatelessWidget {
  const TextTroisDashbord2({
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
                            style: Theme.of(context).textTheme.displayLarge!.copyWith(color: TColors.title, fontSize: 13,fontWeight: FontWeight.bold)
                        ),
                        Text(
                          text2,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: TColors.txtbouttongreydark, fontSize: 12)
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
                  child: Text(text3, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: TColors.txtbouttongreydark, fontSize: 12)),
                ),
              ]
          ),
        )
      ],
    );
  }
}