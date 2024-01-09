import 'package:flutter/material.dart';

import '../../../../../classes/contact.dart';
import '../../../../../utils/constants/colors.dart';
class InfoContact extends StatelessWidget {
  const InfoContact({
    super.key,
    required this.contact, required this.text, required this.bouton, required this.value,
  });

  final Contact contact;
  final String text;
  final bool bouton;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              color: Colors.white,
              width: 152,
              child: Align(
                  alignment:Alignment.centerRight,
                  child: Text(text,style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                      color: TColors.txtbouttongreydark,
                      fontSize: 14,
                      fontFamily: "LatoRegular"
                  )))
          ),
          SizedBox(width: 17,),
          Container(
            width: 355,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  value,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                      color: TColors.title,
                      fontSize: 14,
                      fontFamily: "LatoRegular")
              ),
            ),
          ),
          const SizedBox(width: 11,),
          bouton ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 243, 244, 249),
            ),
            child: Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Défaut",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(
                    color:
                    const Color.fromARGB(255, 128, 131, 163),
                      fontFamily: "LatoRegular"
                  ),
                ),
              ),
            ),
          ): const Text('')
        ],
      ),
    );
  }
}