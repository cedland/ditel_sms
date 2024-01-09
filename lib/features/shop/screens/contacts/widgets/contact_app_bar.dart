
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../add_contact.dart';
import 'add_contact_widget.dart';

enum CustomAppBarFunction {
  back,
  drawer,
}

class ContactAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ContactAppBar({
    super.key,
    required this.title,
    this.additionalIcon,
    this.additionalFunction,
    this.saveUnfinishedOrder,
    required this.config,
  });


  final String title;
  final IconData? additionalIcon;
  final Function()? additionalFunction;
  final Function()? saveUnfinishedOrder;
  final bool config;

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
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton( onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) =>
                      const AddContact(),
                    ),
                  );
                }, icon: const Icon(Icons.person_add,color: TColors.txtbouttongreydark),
                ),
                const VerticalDivider(indent: 10,endIndent: 10,),
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
        child: config ? SizedBox(
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
                      child: const Icon(Icons.tune,color: TColors.txtbouttongreydark,size: 18,)),
                  const SizedBox(width: 10,),
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
                      child: const Icon(Icons.more_vert,color: TColors.txtbouttongreydark,size: 18,)),
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

