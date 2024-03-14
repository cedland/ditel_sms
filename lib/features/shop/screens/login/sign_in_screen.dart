
import 'package:ditel_sms_app/features/shop/screens/login/sign_in_recovery.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/login/agree.dart';
import '../../../../common/widgets/login/custom_button.dart';
import '../../../../common/widgets/login/login_app_bar.dart';
import '../../../../common/widgets/login/text_button.dart';
import '../../../../common/widgets/login/text_form_field.dart';
import '../../../../common/widgets/login/text_form_field_password.dart';
import '../../../../common/widgets/login/titre.dart';
import '../../../../utils/constants/colors.dart';
import '../dashboard/dashbord.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(),
      backgroundColor: TColors.bg,
      body: Center(
        child: Column(
          children: [
            const Titre(title1: 'Bienvenue sur Ditel SMS', title2: 'Connectez-vous.', subtitle: 'Entrer vos identifiants pour vous connecter'),
            //const SizedBox(height: 30,),
            SizedBox(
              width: 420,
              height: 300,
             // color: Colors.pink,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormFieldWidget(label: "Email",validator: "The email you provided is not valid",icon: Icons.mail,hintext: "Enter your Email",width: 420,color: TColors.title,controller: emailController,),
                  const TextFormFieldPasswordWidget(width: 420, color: TColors.txtbouttongreydark,label: "Password",hintext:"Start typing...", icon1: Icons.lock, icon2:Icons.visibility_off,),
                  const SizedBox(height: 18,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const AgreeWidget(text: 'Rester connecté',color: TColors.title,),
                      TextButtonWidget(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInRecoveryScreen()),
                        );
                      }, text: "Mot de passe oublié ?", width: 150,)
                    ],
                  ),
                  const SizedBox(height: 58,),
                  CustomButton(text: 'Connexion',onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard(0)),
                    );
                  },),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
