
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

enum CustomAppBarFunction {
  back,
  drawer,
}

class MessengerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MessengerAppBar({
    super.key,
    required this.title,
    this.additionalIcon,
    this.additionalFunction,
    this.saveUnfinishedOrder,
  });


  final String title;
  final IconData? additionalIcon;
  final Function()? additionalFunction;
  final Function()? saveUnfinishedOrder;

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
              width: 35,
              height: 35,
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
          width: 480,
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
                    child: const Icon(Icons.edit,color: TColors.txtbouttongreydark,size: 14,)),
                const VerticalDivider(indent: 10,endIndent: 10,),
                Container(
                    margin: const EdgeInsets.all(4),
                    alignment: Alignment.center,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: TColors.txtbouttongrey,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      color: TColors.bg,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 11, ),
                        child: TextFormField(
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: TColors.title, fontSize: 13,),
                          cursorColor: TColors.title,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search.....",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                color: TColors.txtbouttongreydark,
                                fontSize: 12),
                          ),

                        ),
                      ),
                    )
                ),
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
                    child: const Icon(Icons.search,color: TColors.txtbouttongreydark,size: 14,)),
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
        child: Text(title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: TColors.title),),
      ),
    );
  }
}

