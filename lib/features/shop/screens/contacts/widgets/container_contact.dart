import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
class ContainerContact extends StatelessWidget {
  const ContainerContact({
    super.key, required this.text1, required this.text2, required this.icon, required this.badge,
  });
  final String text1;
  final String text2;
  final IconData icon;
  final bool badge;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: 320,
      margin: EdgeInsets.only(left: 20,right: 20, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: badge ? TColors.greycontact :TColors.bg,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              width: 22,
              height: 22,
              child: Icon(icon, size: 22,color: TColors.txtbouttongreydark,),
            ),
          ),
          const SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text1, style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(
                  color: TColors.title,
                  fontSize: 14,fontWeight: FontWeight.bold)),
              const SizedBox(height: 3,),
              Text(text2, style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(
                  color: TColors.txtbouttongreydark,
                  fontSize: 13
              ))

            ],
          ),
          const Spacer(),
          badge ?
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0, right: 18),
            child: Container(
              width: 35,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green,
              ),
              child: Center(
                child: Text('99',style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(
                    color: TColors.bg,
                    fontSize: 15)),
              ),
            ),
          ) : const Text(''),
        ],
      ),
    );
  }
}