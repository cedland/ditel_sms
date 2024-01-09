import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/constants/colors.dart';
class TitleWidgetEvenement extends StatelessWidget {
  const TitleWidgetEvenement({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 80.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                border: Border.all(
                  color: TColors.txtbouttongrey,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                color: TColors.bg,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Icon(Icons.menu,color: TColors.txtbouttongreydark,size: 18,)),
          const SizedBox(width: 12,),
          SizedBox(
            width: 370,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Campagnes",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: TColors.title),),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.calendar_month,color: TColors.txtbouttongreydark,size: 18,),
                    const SizedBox(width: 10,),
                    Text(DateFormat.yMMMMd().format(DateTime.now()),style:  Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 14, color: TColors.title),)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}