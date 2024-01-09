
import 'package:flutter/material.dart';
import '../../../../../common/widgets/contact/custom_button_contact.dart';
import '../../../../../data/dummy_data.dart';
import '../../../../../utils/constants/colors.dart';
import '../../contacts/widgets/container_actif.dart';
import '../../contacts/widgets/informations_widget.dart';
import 'container_actif_message.dart';
import 'message_list.dart';
class MessageGroupe extends StatefulWidget {
  const MessageGroupe({
    super.key,
  });

  @override
  State<MessageGroupe> createState() => _MessageGroupeState();
}

class _MessageGroupeState extends State<MessageGroupe> {
  var pageId = 0;

  void openWidget(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(8),
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.width / 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Importer un contact",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                          color: TColors.title,
                          fontSize: 14,fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(8),
                          border: Border.all(width: 0.1)
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.close, size: 18),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Importez vos contacts par fichier XLS ou CSV. Prenez soin de respecter les conditions",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                      color: TColors.title,
                      fontSize: 12),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Importer contacts (XLS, CSV)",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                          color: TColors.txtbouttongreydark,
                          fontSize: 12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sélection fichier",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                              color: TColors.title,
                              fontSize: 14,fontWeight: FontWeight.bold),),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 240, 238, 250),
                            borderRadius: BorderRadiusDirectional.circular(8),

                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.more_horiz,
                              size: 18,
                              color: Color.fromARGB(255, 107, 89, 204),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 246, 246, 246),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Annuler",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                              color:
                              const Color.fromARGB(255, 128, 131, 163)),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 107, 89, 204),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Valider",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
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
                      ? const ContainerActifMessage(text1: "Tous", text2: "Tous les messages reçus", icon: Icons.folder, actif: true, etiquette: true, text3: '5',color: Colors.green,)
                      : const ContainerActifMessage(text1: "Tous", text2: "Tous les messages reçus", icon: Icons.folder, actif: false, etiquette: true, text3: '5',color: Colors.green,)
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
                      ? const ContainerActifMessage(text1: "Favoris", text2: "Messages séléectionnés", icon: Icons.star, actif: true, etiquette: false)
                      : const ContainerActifMessage(text1: "Favoris", text2: "Messages séléectionnés", icon: Icons.star, actif: false, etiquette: false)
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
                      ? const ContainerActifMessage(text1: "Répéter", text2: "Apparaîtra plus tard", icon: Icons.alarm, actif: true, etiquette: true, text3: '3',color: Colors.orange,)
                      : const ContainerActifMessage(text1: "Répéter", text2: "Apparaîtra plus tard", icon: Icons.alarm, actif: false, etiquette: true, text3: '3',color: Colors.orange,)
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
                      ? const ContainerActifMessage(text1: "Brouillons", text2: "Ré-éditez vos messages", icon: Icons.edit, actif: true, etiquette: false)
                      : const ContainerActifMessage(text1: "Brouillons", text2: "Ré-éditez vos messages", icon: Icons.edit, actif: false, etiquette: false)
              ),
              Spacer(),
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
        //pageId == 0 ? const Informations(): const ContactWidget()
        pageId == 0 ? MessageList(you: contacts[0],): Text((''))
      ],
    );
  }
}

