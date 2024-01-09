import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
class TitleWidgetContact extends StatelessWidget {
  const TitleWidgetContact({
    super.key,
    required this.titresimple
  });
  final bool titresimple;



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
              child:Row(
                children: [
                  Text(titresimple ? "Ajouter un nouveau contact": "Contacts",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: TColors.title,fontFamily: "LatoBold"),),
                  const Spacer(),
                  titresimple ? const Text(''): Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          child: const Icon(Icons.tune,color: TColors.txtbouttongreydark,size: 18,)),
                      const SizedBox(width: 8,),
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
                          child: const Icon(Icons.more_vert,color: TColors.txtbouttongreydark,size: 18,)),
                    ],
                  )
                ],
              )

          ),
        ],
      ),
    );
  }
}