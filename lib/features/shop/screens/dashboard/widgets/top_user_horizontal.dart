import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../classes/contact.dart';
import '../../../../../utils/constants/colors.dart';
import 'horizontal_bar.dart';

class TopUsersHorizontal extends StatelessWidget {
  final Contact contact;

  const TopUsersHorizontal({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
          const SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HorizontalBar(
                color: TColors.bgboutton,
                width: contact.numberOfCalls * MediaQuery.of(context).size.width /1800,
              ),
              const SizedBox(height: 2),
              HorizontalBar(
                color: TColors.txtbouttongrey,
                width: contact.numberOfCallsLastWeek * MediaQuery.of(context).size.width /1800,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

