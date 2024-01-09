
import 'package:flutter/material.dart';

import '../../../../common/widgets/login/agree.dart';
import '../../../../common/widgets/login/custom_button.dart';
import '../../../../common/widgets/login/login_app_bar.dart';
import '../../../../common/widgets/login/or.dart';
import '../../../../common/widgets/login/socio_button.dart';
import '../../../../common/widgets/login/text_form_field.dart';
import '../../../../common/widgets/login/titre.dart';
import '../../../../utils/constants/colors.dart';

class SignUp1Screen extends StatelessWidget {
  const SignUp1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(),
      backgroundColor: TColors.bg,
      body: Center(
        child: Column(
          children: [
            const Titre(title1: 'Welcome to BetaCall', title2: 'Sign Up to getting started.', subtitle: 'Enter your details to proceed further'),
            const SizedBox(height: 30,),
            SizedBox(
              width: 420,
                height: 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextFormFieldWidget(label: "Email",validator: "The email you provided is not valid",icon: Icons.mail,hintext: "Enter your Email",width: 420,color: TColors.title,),
                    const SizedBox(height: 18,),
                    const AgreeWidget(text: 'I agree with terms & conditions', color: TColors.subtitle,),
                    const SizedBox(height: 18,),
                    CustomButton(text: 'Sign Up',onPressed: (){},),
                  ],
                ),
            ),
            const Or(),
            const SizedBox(height: 15,),
            Container(
              width: 420,
              height: 180,
              color: TColors.bg,
              child: Column(
                children: [
                  SocioButton(text: 'Sign Up with Google', onPressed: () {}, image:"assets/icons/google.png"),
                  SocioButton(text: 'Sign Up with Facebook', onPressed: () {}, image:"assets/icons/facebook.png"),
                  SocioButton(text: 'Sign Up with Twitter', onPressed: () {}, image:"assets/icons/twitter.png")
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
