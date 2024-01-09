import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
class ActionWidgetContact extends StatefulWidget {
   const ActionWidgetContact({
    super.key, required this.ajoutContact,
  });
   final Function() ajoutContact;

  @override
  State<ActionWidgetContact> createState() => _ActionWidgetContactState();
}

class _ActionWidgetContactState extends State<ActionWidgetContact> {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: widget.ajoutContact,
            child: Container(
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
                child: const Icon(Icons.person_add,color: TColors.txtbouttongreydark,size: 18,)),
          ),
          const SizedBox(width: 10,),
          const VerticalDivider(indent: 10,endIndent: 10,),
          const SizedBox(width: 10,),
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
              child: const Icon(Icons.search,color: TColors.txtbouttongreydark,size: 18,)),
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