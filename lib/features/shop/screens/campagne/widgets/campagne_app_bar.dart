
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/constants/colors.dart';

class CampagneAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CampagneAppBar({
    super.key,
    required this.title,
    required this.date, required this.navig,
  });


  final String title;
  final bool date;
  final bool navig;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const Border(
          bottom: BorderSide(
              color: TColors.txtbouttongrey,
              width: 1
          )
      ),
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: IconButton(
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          icon: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: TColors.txtbouttongrey,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                color: TColors.bg,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Icon(Icons.menu,color: TColors.txtbouttongreydark,size: 18,)),
          color: Colors.white,
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(4),
          alignment: Alignment.center,
          width: 180,
          decoration: const BoxDecoration(
            //borderRadius: BorderRadius.all(Radius.circular(20)),
              color: TColors.bg
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                navig ? SizedBox(
                  width: 75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width:35,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200, width: 1),
                            borderRadius: BorderRadius.circular(8),
                            color: TColors.bg,
                          ),
                          child: const Icon(Icons.keyboard_arrow_up_rounded,color: TColors.subtitle,size: 18,)),
                      Container(
                          width:35,
                          height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade200, width: 1),
                          borderRadius: BorderRadius.circular(8),
                          color: TColors.bg,
                        ),
                          child: const Icon(Icons.keyboard_arrow_down_rounded,color: TColors.subtitle,size: 18,)),
                    ],
                  ),
                ) : const Text(''),
                navig ? const VerticalDivider(indent: 10,endIndent: 10,) : const Text(''),
                Container(
                    width: 40,
                    height: 40,
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
                SizedBox(
                    height: 40,
                    width: 40,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset('assets/icons/img1.png',fit: BoxFit.fill,width: 30,height: 30,)
                    )
                ),
              ],
            ),
          ),
        ),
      ],
      backgroundColor: TColors.bg,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: date ? SizedBox(
          width: 300,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title,
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
        ) : Text(title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: TColors.title),),
      ),
    );
  }
}

