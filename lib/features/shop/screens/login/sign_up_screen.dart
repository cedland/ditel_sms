
import 'package:flutter/material.dart';
import '../../../../common/widgets/login/login_app_bar.dart';
import '../../../../common/widgets/login/text_button.dart';
import '../../../../utils/constants/colors.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(),
      backgroundColor: TColors.bg,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:120, bottom: 20),
              child: Container(
                width: 220,
                height: 220,
                color: TColors.bg,
                child: Image.asset('assets/icons/image3.png',fit: BoxFit.cover,)
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("C’est parti !",style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontFamily: 'LatoBold',color: TColors.title,fontSize: 26)),
                const SizedBox(height: 5,),
                Text("Nous envoyons un email à catherine.shaw@gmail.com",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14,
                  fontFamily: 'LatoRegular',
                  color: TColors.subtitle, ),),
                Text("Cliquez sur le lien de confirmation dans l'e-mail pour vérifier votre compte",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14,
                  fontFamily: 'LatoRegular',
                  color: TColors.subtitle, ),),
                const SizedBox(height: 20,),
                TextButtonWidget(onPressed: () {}, text: "Ré-envoyer l'email", width: 125,)
              ],
            )
          ],
        ),
      ),

    );
  }
}
