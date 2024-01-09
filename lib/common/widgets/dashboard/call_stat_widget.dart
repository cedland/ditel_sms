import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../utils/constants/colors.dart';
class CallStatWidget extends StatelessWidget {
  const CallStatWidget({
    super.key, required this.text1, required this.text2, required this.text3, required this.color, required this.percent,
  });
  final String text1;
  final String text2;
  final String text3;
  final Color color;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text1,style: Theme.of(context).textTheme.displayLarge!.copyWith(color: TColors.title, fontSize: 13,fontWeight: FontWeight.bold)),
              const SizedBox(height: 3,),
              Text(text2,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: TColors.txtbouttongreydark, fontSize: 12)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(text3,style: Theme.of(context).textTheme.displayLarge!.copyWith(color: TColors.title, fontSize: 13,fontWeight: FontWeight.bold)),
              ),
              //Text('Total time spent',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: TColors.txtbouttongreydark, fontSize: 12)),
              const SizedBox(height: 3,),
              LinearPercentIndicator(
                animation: true,
                animationDuration: 1000,
                width: 90,
                lineHeight: 5.0,
                percent: percent,
                backgroundColor: TColors.txtbouttongrey,
                progressColor: color,
                barRadius: const Radius.circular(8),
              ),
            ],
          ),
        ],
      ),
    );
  }
}