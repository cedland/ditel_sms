import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/constants/colors.dart';
class ActionWidgetDashboard extends StatelessWidget {
  const ActionWidgetDashboard({
    super.key,
    required this.search,
    required this.showsearch,
  });
  final Function() search;
  final bool showsearch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
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
              child: StatefulBuilder(
                  builder: (context, setState) {
                    return GestureDetector(
                      onTap: search,
                        child: const Icon(Icons.search,color: TColors.txtbouttongreydark,size: 18,));
                  }
              )
          ),
          const SizedBox(width: 10,),
          SizedBox(
              height: 35,
              width: 35,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset('assets/icons/img1.png',fit: BoxFit.fill,width: 30,height: 30,)
              )
          ),
        ],
      ),
    );
  }
}