
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class Titre1 extends StatelessWidget {
  const Titre1({super.key, this.title1, this.subtitle,});

  final String? title1;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            color: TColors.bg,
            width: 373,
            height: 85,
            margin: const EdgeInsets.only(top:50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title1!,style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 24, color: TColors.title)),
                const SizedBox(height: 8,),
                Text(subtitle!,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 10,
                    color: TColors.subtitle)),
              ],
            )
        ),
      ],
    );
  }
}
