
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoginAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 840,
      height: 64,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: TColors.white,
          border: Border(
            bottom: BorderSide(
              color: TColors.txtbouttongrey,
              width: 1.0,
            ),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: TColors.white,
            width: 125,
            height: 44,
            margin: const EdgeInsets.only(left: 135),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 22,
                  width: 22,
                  child: Image.asset('assets/icons/logoicon.png')
                ),
                Container(
                  width: 85.57,
                  height: 18.77,
                  color: TColors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 8.575,vertical: 6.21),
                  child: RichText(
                    text: TextSpan(text: 'beta',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 18,
                        color: TColors.subtitle,fontWeight: FontWeight.w400,fontFamily: "LatoRegular"),
                      //style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text: 'call', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 18,
                            color: TColors.title,fontWeight: FontWeight.bold,fontFamily: "LatoBold")),
                      ],
                    ),
                  )
                )
              ],
            )
          ),
          Container(
            color: TColors.white,
            width: 116,
            height: 44,
            //margin: const EdgeInsets.only(left: 700),
            margin: const EdgeInsets.only(right: 135),
            child: Container(
              margin: const EdgeInsets.all(2),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(
                      color: Color.fromARGB(200, 158, 158, 158), width: 0.1),
                ),
                child: Text(
                  "Contact",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 16,
                  color: TColors.subtitle,fontWeight: FontWeight.w400,fontFamily: "LatoRegular"
                ),),
                onPressed: () {/*Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const Login(),),);*/},
              ),
            ),
          )
        ],
      )
    );
  }
}
