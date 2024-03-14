
import 'package:flutter/material.dart';
import '../../../../common/widgets/login/agree.dart';
import '../../../../common/widgets/login/custom_button.dart';
import '../../../../common/widgets/login/login_app_bar.dart';
import '../../../../common/widgets/login/text_form_field.dart';
import '../../../../common/widgets/login/text_form_field_password.dart';
import '../../../../common/widgets/login/titre1.dart';
import '../../../../utils/constants/colors.dart';

class SignUp2Screen extends StatelessWidget {
  SignUp2Screen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LoginAppBar(),
      backgroundColor: TColors.bg,
      body: Center(
        child: Column(
          children: [
            const Titre1(title1: 'Tell us more about yourself',subtitle: 'Enter your details to proceed further'),
           const SizedBox(height: 20,),
            SizedBox(
              width: 420,
              height: 400,
              //color: Colors.pink,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormFieldWidget(label: "Email",validator: "The email you provided is not valid",icon: Icons.mail,hintext:"Enter your Email",width: 420,color: TColors.title,controller: emailController,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormFieldWidget(label: "First Name",icon: Icons.person,hintext:"Enter your name",width: 200,color: TColors.txtbouttongreydark,controller: firstnameController,),
                      TextFormFieldWidget(label: "Last Name",icon: Icons.person,hintext:"Enter your last name",width: 200,color: TColors.txtbouttongreydark,controller: lastnameController,),
                    ],
                  ),
                  const TextFormFieldPasswordWidget(width: 420, color: TColors.txtbouttongreydark,label: "Password",hintext:"Enter your password", icon1: Icons.lock, icon2:Icons.visibility_off,),
                  const TextFormFieldPasswordWidget(width: 420, color: TColors.txtbouttongreydark,label: "Confirm password", icon1: Icons.lock, icon2:Icons.visibility_off,),
                  const SizedBox(height: 18,),
                  const AgreeWidget(text: 'I agree with terms & conditions',color: TColors.subtitle,),
                  const SizedBox(height: 28,),
                  CustomButton(text: 'Continue',onPressed: (){},),

                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
