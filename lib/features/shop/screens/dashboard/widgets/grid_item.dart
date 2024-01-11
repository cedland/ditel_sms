
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class GridItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() ontap;

  const GridItem({super.key, required this.icon, required this.text,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color.fromARGB(100, 158, 158, 158),
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: TColors.bgboutton,
              size: 16,
            ),
            const SizedBox(width: 2),
           Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: TColors.bgboutton,fontSize: 12,fontFamily: "LatoBold"),
            ),
          ],
        ),
      ),
    );
  }
}
