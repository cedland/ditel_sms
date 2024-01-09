
import 'package:ditel_sms_app/features/shop/screens/settings/widgets/securite_setting.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/contact/custom_button_contact.dart';
import '../../../../../utils/constants/colors.dart';
import '../../contacts/widgets/container_actif.dart';
import '../../contacts/widgets/informations_widget.dart';
import 'ditel_setting.dart';
import 'information_setting.dart';
class GroupSetting extends StatefulWidget {
  const GroupSetting({
    super.key,
  });

  @override
  State<GroupSetting> createState() => _GroupSettingState();
}

class _GroupSettingState extends State<GroupSetting> {
  var pageId = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 331,
          height: 679,
          //color: Colors.red,
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide( //                   <--- left side
                color: TColors.txtbouttongrey,
                width: 1.0,
              ),
              right: BorderSide( //                    <--- top side
                color: TColors.txtbouttongrey,
                width: 1.0,
              ),
            ),
            color: TColors.bg,
          ),
          child: Column(
            children: [
              //ContainerContact(text1: 'Tous', text2: 'Vos contacts', icon: Icons.account_circle, badge: true,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 114,
                    width: 114,
                    margin: const EdgeInsets.only(left: 30,right: 30,top: 30,bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: TColors.greycontact,
                    ),
                    child: const Icon(Icons.cloud_upload_rounded,color: TColors.txtbouttongreydark,size: 28,),
                  ),
                  const SizedBox(height: 10,),
                  Text('PRESTACALL',style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                      color: TColors.title,
                      fontSize: 17,fontFamily: "LatoBold")),
                  const SizedBox(height: 3,),
                ],
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 0;
                    });
                  },
                  child: pageId == 0
                      ? const ContainerActif(text1: "Information entreprise", text2: "Information générales", icon: Icons.assignment, actif: true,)
                      : const ContainerActif(text1: "Information entreprise", text2: "Information générales", icon: Icons.assignment, actif: false,)
              ),
              const Divider(
                color: TColors.txtbouttongrey,
                indent: 35,
                endIndent: 35,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 1;
                    });
                  },
                  child: pageId == 1
                      ? const ContainerActif(text1: "Sécurité", text2: "Identifiants",icon: Icons.security,actif: true,)
                      : const ContainerActif(text1: "Sécurité", text2: "Identifiants",icon: Icons.security,actif: false,)
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 2;
                    });
                  },
                  child: pageId == 2
                      ? const ContainerActif(text1: "Ditel", text2: "Intégration Ditel SMS",icon: Icons.domain,actif: true,)
                      : const ContainerActif(text1: "Ditel", text2: "Intégration Ditel SMS",icon: Icons.domain,actif: false,)
              ),

            ],
          ),

        ),
        //pageId == 0 ? const Informations(): const ContactWidget()
        pageId == 0 ? const InformationSetting() : (pageId == 1 ? const SecuriteSetting() : const DitelSetting())
      ],
    );
  }
}

