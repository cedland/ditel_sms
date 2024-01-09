import 'package:ditel_sms_app/features/shop/screens/dashboard/widgets/vertical_bar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../classes/contact.dart';
import '../../../../../utils/constants/colors.dart';

class TopUsers extends StatelessWidget {
  final Contact contact;

  const TopUsers({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              VerticalBar(
                color: const Color.fromARGB(255, 107, 89, 204),
                height: contact.numberOfCalls * MediaQuery.of(context).size.height /3000,
              ),
              const SizedBox(width: 3),
              VerticalBar(
                color: const Color.fromARGB(255, 236, 238, 245),
                height: contact.numberOfCallsLastWeek * MediaQuery.of(context).size.height /3000,
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              contact.image,
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

