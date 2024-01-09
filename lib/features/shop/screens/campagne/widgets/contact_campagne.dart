
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../classes/contact.dart';
import '../../../../../utils/constants/colors.dart';

class ContactCampagne extends StatelessWidget {
  final Contact contact;

  const ContactCampagne({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child:
      Container(
        height: 20,
        //width: 150,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey.shade100,
          ),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      contact.image,
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Text(contact.name,style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(
                      fontFamily: "LatoBold",
                      fontSize: 14,color: TColors.title),),
                  const SizedBox(width: 5,),
                  const Icon(Icons.clear,color: TColors.txtbouttongreydark,)
                ],
              ),
        ),
      ),
    );
  }
}

