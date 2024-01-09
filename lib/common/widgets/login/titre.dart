
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class Titre extends StatelessWidget {
  const Titre({super.key, this.title1, this.title2, this.subtitle,});

  final String? title1;
  final String? title2;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: TColors.bg,
          width: 352,
          height: 101,
          margin: const EdgeInsets.symmetric(vertical:50.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title1!,style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontFamily: 'LatoBold',color: TColors.title,fontSize: 26)),
              const SizedBox(height: 3,),
              Text(title2!,style:  Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontFamily: 'LatoBold',fontSize: 26, color: TColors.title),),
              const SizedBox(height: 8,),
              Text(subtitle!,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14,
                  fontFamily: 'LatoRegular',
                  color: TColors.subtitle, ),)
            ],
          )
        ),
      ],
    );
  }
}
