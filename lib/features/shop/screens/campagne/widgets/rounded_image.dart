
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../classes/contact.dart';
import '../../../../../utils/constants/colors.dart';

class RoundedImage extends StatelessWidget {
  final Contact contact;

  const RoundedImage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              contact.image,
              width: 32,
              height: 32,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

