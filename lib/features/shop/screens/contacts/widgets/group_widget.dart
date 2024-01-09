import 'package:flutter/material.dart';

import '../../../../../data/dummy_data.dart';
import '../../../../../utils/constants/colors.dart';
import '../widget_contact/container_actif_contact.dart';
import 'contact_list_view.dart';
import 'container_contact.dart';
import 'groupe_widget.dart';
class GroupWidget extends StatefulWidget {
  const GroupWidget({
    super.key,
  });

  @override
  State<GroupWidget> createState() => _GroupWidgetState();
}

class _GroupWidgetState extends State<GroupWidget> {
  var pageId = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 331,
          height: 679,
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
            //color: Colors.red,
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
                      ? const ContainerActifContact(text1: "Tous", text2: "Vos contacts", icon: Icons.folder, actif: true, etiquette: true, text3: '5',color: Colors.green,)
                      : const ContainerActifContact(text1: "Tous", text2: "Vos contacts", icon: Icons.folder, actif: false, etiquette: true, text3: '5',color: Colors.green,)
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
                      ? const ContainerActifContact(text1: "Entreprises", text2: "Vos entreprises", icon: Icons.people, actif: true, etiquette: false)
                      : const ContainerActifContact(text1: "Entreprises", text2: "Vos entreprises", icon: Icons.people, actif: false, etiquette: false)
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
                      ? const ContainerActifContact(text1: "Clients", text2: "Vos clients", icon: Icons.people, actif: true, etiquette: false, text3: '3',color: Colors.orange,)
                      : const ContainerActifContact(text1: "Clients", text2: "Vos clients", icon: Icons.people, actif: false, etiquette: false, text3: '3',color: Colors.orange,)
              ),
              const Divider(
                color: TColors.txtbouttongrey,
                indent: 35,
                endIndent: 35,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 3;
                    });
                  },
                  child: pageId == 3
                      ? const ContainerActifContact(text1: "Clients", text2: "Vos clients", icon: Icons.people, actif: true, etiquette: false, text3: '3',color: Colors.orange,)
                      : const ContainerActifContact(text1: "Clients", text2: "Vos clients", icon: Icons.people, actif: false, etiquette: false, text3: '3',color: Colors.orange,)
              ),
              const Divider(
                color: TColors.txtbouttongrey,
                indent: 35,
                endIndent: 35,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 4;
                    });
                  },
                  child: pageId == 4
                      ? const ContainerActifContact(text1: "Groupe A", text2: "Votre groupe A", icon: Icons.people, actif: true, etiquette: false)
                      : const ContainerActifContact(text1: "Groupe A", text2: "Votre groupe A", icon: Icons.people, actif: false, etiquette: false)
              ),
              const Divider(
                color: TColors.txtbouttongrey,
                indent: 35,
                endIndent: 35,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 5;
                    });
                  },
                  child: pageId == 5
                      ? const ContainerActifContact(text1: "Groupe B", text2: "Votre groupe B", icon: Icons.people, actif: true, etiquette: false)
                      : const ContainerActifContact(text1: "Groupe B", text2: "Votre groupe B", icon: Icons.people, actif: false, etiquette: false)
              ),
              const Divider(
                color: TColors.txtbouttongrey,
                indent: 35,
                endIndent: 35,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 6;
                    });
                  },
                  child: pageId == 6
                      ? const ContainerActifContact(text1: "Ajouter", text2: "un nouveau groupe", icon: Icons.add_circle_outlined, actif: true, etiquette: false)
                      : const ContainerActifContact(text1: "Ajouter", text2: "un nouveau groupe", icon: Icons.add_circle_outlined, actif: false, etiquette: false)
              ),

              const Spacer(),
              /*GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 5;
                    });
                  },
                  child: pageId == 5
                      ? const ContainerActifContact(text1: "Supprimer", text2: "Messages supprimés", icon: Icons.delete, actif: true, etiquette: false)
                      : const ContainerActifContact(text1: "Supprimer", text2: "Messages supprimés", icon: Icons.delete, actif: false, etiquette: false)
              ),*/

              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 7;
                    });
                  },
                  child: pageId == 7
                      ? const ContainerActifContact(text1: "Supprimer", text2: "Messages supprimés", icon: Icons.delete, actif: true, etiquette: false)
                      : const ContainerActifContact(text1: "Supprimer", text2: "Messages supprimés", icon: Icons.delete, actif: false, etiquette: false)
              ),

            ],
          ),
        ),
        pageId == 0 ?Container(
          color: TColors.bg,
          height: double.infinity,
          width: 1096,
          child: Row(
            children: [
              Expanded(child: ContactListView(contacts: contacts,)),
            ],
          ),
        ): const Text('')
      ],
    );
  }
}