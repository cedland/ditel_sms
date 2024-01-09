import 'package:flutter/material.dart';

import '../../../../../classes/contact.dart';
import '../../../../../utils/constants/colors.dart';
class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.contact,
  });

  final Contact contact;

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
                  child: Text("Social",style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                      color: TColors.txtbouttongreydark,
                      fontSize: 14
                  )))
          ),
          SizedBox(width: 17,),
          Container(
            width: 355,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                _buildRowIcon("assets/icons/facebook.png"),
                _buildRowIcon("assets/icons/linked.png"),
                _buildRowIcon("assets/icons/twitter.png"),
                _buildRowIcon("assets/icons/insta.png"),
                _buildRowIcon("assets/icons/whatsapp.png"),
               /* _buildRowIcon(Icons.edit),
                _buildRowIcon(Icons.edit),
                _buildRowIcon(Icons.edit),
                _buildRowIcon(Icons.edit),*/
              ],
            ),
          )

        ],
      ),
    );
  }
}
Widget _buildRowIcon(String image) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 2.0),
    child: Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color:TColors.bg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 0.5,
        ),
      ),
      child: Image.asset(
        image,
        width: 28,
        height: 28,
      ),
    ),
  );
}