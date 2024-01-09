import 'package:ditel_sms_app/features/shop/screens/campagne/widgets/parametre_campagne.dart';
import 'package:ditel_sms_app/features/shop/screens/campagne/widgets/rediger_message.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/contact/custom_button_contact.dart';
import '../../../../../data/dummy_data.dart';
import '../../../../../utils/constants/colors.dart';
import '../../contacts/widgets/container_actif.dart';
import '../../contacts/widgets/informations_widget.dart';
import '../../message/widgets/container_actif_message.dart';
import 'ajouter_evenement.dart';
import 'importer_campagne.dart';
class NouvelleCampagneGroupe extends StatefulWidget {
  const NouvelleCampagneGroupe({
    super.key,
  });

  @override
  State<NouvelleCampagneGroupe> createState() => _NouvelleCampagneGroupeState();
}

class _NouvelleCampagneGroupeState extends State<NouvelleCampagneGroupe> {
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
              Container(
                height: 90,
                width: 90,
                margin: const EdgeInsets.only(left: 30,right: 30,top: 30,bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: TColors.greycontact,
                ),
                child: const Icon(Icons.calendar_month,color: TColors.txtbouttongreydark,size: 28,),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 0;
                    });
                  },
                  child: pageId == 0
                      ? const ContainerActifMessage(text1: "Paramètres campagne", text2: "Nom, contacts, planning", icon: Icons.person, actif: true, etiquette: false,)
                      : const ContainerActifMessage(text1: "Paramètres campagne", text2: "Nom, contacts, planning", icon: Icons.person, actif: false, etiquette: false,)
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
                      ? const ContainerActifMessage(text1: "Rédaction message", text2: "Le contenu de votre campagne", icon: Icons.email, actif: true, etiquette: false)
                      : const ContainerActifMessage(text1: "Rédaction message ", text2: "Le contenu de votre campagne", icon: Icons.email, actif: false, etiquette: false)
              ),
              const Divider(
                color: TColors.txtbouttongrey,
                indent: 35,
                endIndent: 35,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 2;
                    });
                  },
                  child: pageId == 2
                      ? const ContainerActifMessage(text1: "Importer campagne (Excel, CSV)", text2: "Importer votre campagne", icon: Icons.calendar_month, actif: true, etiquette: false)
                      : const ContainerActifMessage(text1: "Importer campagne (Excel, CSV)", text2: "Importer votre campagne", icon: Icons.calendar_month, actif: false, etiquette: false)
              ),


            ],
          ),

        ),
        pageId == 0 ? const ParametreCampagne() : (pageId == 1 ? const RedigerMessage() : const ImporterCampagne())

      ],
    );
  }

}
