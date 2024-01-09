import 'package:ditel_sms_app/features/shop/screens/contacts/widgets/contact_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/contact/custom_button_contact.dart';
import '../../../../../utils/constants/colors.dart';
import '../../dashboard/widgets/contact_widget.dart';
import 'add_contact_field.dart';
import 'container_actif.dart';
import 'groupe_add_widget.dart';
import 'informations_widget.dart';
class GroupAdd extends StatefulWidget {
  const GroupAdd({
    super.key,
  });

  @override
  State<GroupAdd> createState() => _GroupAddState();
}

class _GroupAddState extends State<GroupAdd> {
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
                 Text('Cynthia Newman',style: Theme.of(context)
                     .textTheme
                     .bodySmall!
                     .copyWith(
                     color: TColors.title,
                     fontSize: 17,fontWeight: FontWeight.bold)),
                 const SizedBox(height: 3,),
                 Text("UI/UX Designer", style: Theme.of(context)
                     .textTheme
                     .bodySmall!
                     .copyWith(
                     color: TColors.txtbouttongreydark,
                     fontSize: 13
                 ))

               ],
             ),
              SizedBox(height: 20,),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      pageId = 0;
                    });
                  },
                  child: pageId == 0
                      ? const ContainerActif(text1: "Information générales", text2: "Photo, nom, adresse", icon: Icons.person, actif: true,)
                      : const ContainerActif(text1: "Information générales", text2: "Photo, nom, adresse", icon: Icons.person, actif: false,)),
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
                    ? const ContainerActif(text1: "Contact", text2: "N° tel, email",icon: Icons.notifications,actif: true,)
                    : const ContainerActif(text1: "Contact", text2: "N° tel, email",icon: Icons.notifications,actif: false,)
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 250,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(
                            255, 107, 89, 204),
                      ),
                      child: TextButton(
                        onPressed: () {
                          openWidget(context);
                        },
                        child: Text(
                          "Import contacts XLS, CSV",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),

        ),
       pageId == 0
            ? const Informations(): const ContactWidgetContact()
      ],
    );
  }
}

