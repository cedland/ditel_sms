import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
class GroupeWidget extends StatelessWidget {
  const GroupeWidget({
    super.key, required this.text, required this.icon, required this.ajout,
  });
  final String text;
  final IconData icon;
  final bool ajout;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: 320,
      margin: const EdgeInsets.only(left: 20,right: 20),
      decoration: const BoxDecoration(
        color: TColors.bg,
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
          Text(text, style: ajout ? Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(
              color: TColors.title,
              fontSize: 14,fontWeight: FontWeight.bold) : Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(
              color: TColors.txtbouttongreydark,
              fontSize: 13
          )),
        ],
      ),
    );
  }
}