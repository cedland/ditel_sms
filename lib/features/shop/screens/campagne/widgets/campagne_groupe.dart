
import 'package:flutter/material.dart';
import '../../../../../common/widgets/contact/custom_button_contact.dart';
import '../../../../../data/dummy_data.dart';
import '../../../../../utils/constants/colors.dart';
import '../../contacts/widgets/container_actif.dart';
import '../../contacts/widgets/informations_widget.dart';
import '../../message/widgets/container_actif_message.dart';
import 'ajouter_evenement.dart';
class CampagneGroupe extends StatefulWidget {
  const CampagneGroupe({
    super.key,
  });

  @override
  State<CampagneGroupe> createState() => _CampagneGroupeState();
}

class _CampagneGroupeState extends State<CampagneGroupe> {
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
              const SizedBox(height: 20,),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 0;
                    });
                  },
                  child: pageId == 0
                      ? const ContainerActifMessage(text1: "Toutes les campagnes", text2: "Classées par date d’envoi", icon: Icons.person, actif: true, etiquette: false,)
                      : const ContainerActifMessage(text1: "Toutes les campagnes", text2: "Classées par date d’envoi", icon: Icons.person, actif: false, etiquette: false,)
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
                      ? const ContainerActifMessage(text1: "Tapez pour ajouter ", text2: "un nouveau groupe", icon: Icons.add_circle_outlined, actif: true, etiquette: false)
                      : const ContainerActifMessage(text1: "Tapez pour ajouter ", text2: "un nouveau groupe", icon: Icons.add_circle_outlined, actif: false, etiquette: false)
              ),

              const Spacer(),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 3;
                    });
                  },
                  child: pageId == 3
                      ? const ContainerActifMessage(text1: "Supprimer", text2: "Messages supprimés", icon: Icons.delete, actif: true, etiquette: false)
                      : const ContainerActifMessage(text1: "Supprimer", text2: "Messages supprimés", icon: Icons.delete, actif: false, etiquette: false)
              ),

            ],
          ),

        ),

        pageId == 0 ? AjouterEvenement(onPressed: () {},): const Text((''))
      ],
    );
  }
}
