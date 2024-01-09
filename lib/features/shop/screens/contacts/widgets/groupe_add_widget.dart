import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
class GroupeAddWidget extends StatelessWidget {
  const GroupeAddWidget({
    super.key, required this.text, required this.icon, required this.text2,
  });
  final String text;
  final String text2;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: 72,
        width:298,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration:  BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  width: 28,
                  height: 28,
                  child: Icon(icon, size: 28,color: TColors.txtbouttongreydark,),
                ),
              ),
              const SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text, style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                      color: TColors.title,
                      fontSize: 14,fontWeight: FontWeight.bold) ),
                  Text(text2, style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                      color: TColors.txtbouttongreydark,
                      fontSize: 13
                  ),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}