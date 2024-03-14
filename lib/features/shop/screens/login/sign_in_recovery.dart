import 'package:ditel_sms_app/features/shop/screens/login/sign_up_screen.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/login/custom_button.dart';
import '../../../../common/widgets/login/login_app_bar.dart';
import '../../../../common/widgets/login/text_button.dart';
import '../../../../common/widgets/login/text_form_field.dart';
import '../../../../utils/constants/colors.dart';


class SignInRecoveryScreen extends StatelessWidget {
  SignInRecoveryScreen({super.key});

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(),
      backgroundColor: TColors.bg,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:60, bottom: 10),
              child: Container(
                  width: 230,
                  height: 200,
                  color: TColors.bg,
                  child: Image.asset('assets/icons/image4.png',fit: BoxFit.cover,)
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Mot de passe oublié ?",style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontFamily: 'LatoBold',color: TColors.title,fontSize: 26)),
                Text("Renouveler",style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontFamily: 'LatoBold',color: TColors.title,fontSize: 26)),
                const SizedBox(height: 7,),
                Text("Indiquez votre email pour récupérer votre mot de passe",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14,
                  fontFamily: 'LatoRegular',
                  color: TColors.subtitle, ),),
                const SizedBox(height: 25,),
                TextFormFieldWidget(label: "Email",validator: "The email you provided is not valid",icon: Icons.mail,hintext: "Enter your Email",width: 420,color: TColors.title, controller: emailController,),
                const SizedBox(height: 25,),
                CustomButton(text: 'Valider',onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpScreen()),
                  );
                },),
              ],
            )
          ],
        ),
      ),

    );
  }
}
