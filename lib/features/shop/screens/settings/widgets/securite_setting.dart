import 'package:flutter/material.dart';

import '../../../../../common/widgets/login/text_form_field.dart';
import '../../../../../common/widgets/login/text_form_field_password.dart';
import '../../../../../utils/constants/colors.dart';
import '../../contacts/widgets/boutton_contact.dart';
import 'boutton_settings.dart';

class SecuriteSetting extends StatefulWidget {
  const SecuriteSetting({
    super.key,
  });

  @override
  State<SecuriteSetting> createState() => _SecuriteSettingState();
}

class _SecuriteSettingState extends State<SecuriteSetting> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height - 80,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Connexion",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                        fontFamily: "LatoBold"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormFieldPasswordWidget(label: "Votre mot de passe",hintext:"Entrer le mot de passe",width: 505,color: TColors.txtbouttongreydark, icon1: Icons.lock, icon2:Icons.visibility_off,),

                      TextFormFieldPasswordWidget(label: "Confirmer mot de passe",hintext:"Confirmer votre mot de passe",width: 505,color: TColors.txtbouttongreydark, icon1: Icons.lock, icon2:Icons.visibility_off,),
                    ],
                  ),
                ),
              ],
            ),


            BouttonSetting(onPressed1: () {}, onPressed2: () {})
          ],
        ),
      ),
    );
  }
}

