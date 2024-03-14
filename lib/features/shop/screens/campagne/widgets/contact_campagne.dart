
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../classes/contact.dart';
import '../../../../../utils/constants/colors.dart';

class ContactCampagne extends StatelessWidget {
  final String image;
  final String name;
  final void Function() ontap;

  const ContactCampagne({super.key, required this.image, required this.name, required this.ontap,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child:
      Container(
        height: 15,
        //width: 150,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey.shade100,
          ),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:Image.network(
                      image,
                      width: 6,
                      height: 6,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset('assets/images/dashboard/img1.png');
                      },
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Text(name,style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(
                      fontFamily: "LatoBold",
                      fontSize: 10,color: TColors.title),),
                  const SizedBox(width: 5,),
                  InkWell(onTap:ontap,child: const Icon(Icons.clear,color: TColors.txtbouttongreydark,))
                ],
              ),
        ),
      ),
    );
  }
}

