import 'dart:convert';
import 'package:ditel_sms_app/features/shop/screens/contacts/widgets/social_boutton.dart';
import 'package:flutter/material.dart';
import '../../../../../classes/contact_model.dart';
import '../../../../../services/contact_services.dart';
import '../../../../../utils/constants/colors.dart';
import 'contact_detailled.dart';
import 'contact_info.dart';
import 'contact_page_select.dart';
import 'package:http/http.dart' as http;

import 'infos_contact_widget.dart';
class ContactListView extends StatefulWidget {

  const ContactListView({super.key});
  @override
  ContactListViewState createState() => ContactListViewState();
}

class ContactListViewState extends State<ContactListView> {
  List contactdata=[];

  void openWidget(BuildContext context, String? image, String? nom_prenom, String? fonction, String? telephone,String? email, String? groupe_nom, String? entreprise, String? adresse, String? complement_adresse, String? ville,String? code_postal, String? pays) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding:const EdgeInsets.only(left: 1000, top: 50) ,
          child: Dialog(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(8),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.width / 4 +400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Information du contact",
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child:
                            Image.network(
                              image!,
                              width: 90,
                              height: 90,
                              fit:BoxFit.cover,
                              errorBuilder: (BuildContext context, Object exception,
                                  StackTrace? stackTrace) {
                                return Image.asset('assets/images/dashboard/img1.png');
                              },
                            )
                        ),
                      ),
                      Text(
                          nom_prenom!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                              color: TColors.title,
                              fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "LatoBold")
                      ),
                      Text(
                          fonction!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                              color: TColors.txtbouttongreydark,
                              fontSize: 14,
                              fontFamily: "LatoRegular"
                          )
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: TColors.bgboutton,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextButton.icon(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(16),
                              ),
                              icon: const Icon(
                                Icons.mail,
                                color: Colors.white,
                                size: 16,
                              ),
                              label: Text(
                                "Message",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.white, fontFamily: "LatoBold"),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          _buildRowIcon(Icons.edit),
                          const SizedBox(
                            width: 5,
                          ),
                          _buildRowIcon(Icons.drive_folder_upload),
                          const SizedBox(
                            width: 5,
                          ),
                          _buildRowIcon(Icons.delete),
                        ],
                      ),
                      const SizedBox(height: 25),
                      InfoContact(text: 'Tel', bouton:true, value:telephone!,),
                      InfoContact(text: 'Email', bouton: false, value: email!,),
                      InfoContact(text: 'Groupe', bouton: false, value: groupe_nom!,),
                      InfoContact(text: 'Entreprise', bouton: false, value: entreprise!,),
                      InfoContact(text: 'Adresse', bouton: false, value: adresse!,),
                      InfoContact(text: 'Complément', bouton: false, value:complement_adresse!,),
                      InfoContact(text: 'Code postal', bouton: false, value:code_postal!,),
                      InfoContact(text: 'Ville', bouton: false, value:ville!,),
                      InfoContact(text: 'Pays', bouton: false, value: pays!,),
                      const SizedBox(height: 40,),

                      const SocialButton()
                    ],
                  ),
                  /*ContactInfo(
                                        onClosePressed: _onClosePressed, image: contact.image!, name: contact.nom_prenom!, fonction: contact.fonction!, telephone: contact.telephone!, email: contact.email!, groupe: contact.groupe_nom!, adresse: contact.adresse!, complement: contact.complement_adresse!, cp: contact.code_postal!, pays: contact.pays!, ville: contact.ville!,
                                        //onClosePressed: _onClosePressed, image: contactdata[selectedContactIndex!]["image"], name: contactdata[selectedContactIndex!]["nom_prenom"], fonction: contactdata[selectedContactIndex!]["fonction"], telephone: contactdata[selectedContactIndex!]["telephone"], email: contactdata[selectedContactIndex!]["email"], groupe: contactdata[selectedContactIndex!]["groupe_nom"], adresse: contactdata[selectedContactIndex!]["adresse"], complement: contactdata[selectedContactIndex!]["complement_adresse"], cp: contactdata[selectedContactIndex!]["code_postal"], pays: contactdata[selectedContactIndex!]["pays"], ville: contactdata[selectedContactIndex!]["ville"],
                                      )*/
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  List<ContactModel> listContact=[];
  bool iscontact = true;

  getAllContact()async{
    listContact= await ContactService().getContact();
    setState(() {
      contactdata = listContact;
      iscontact = false;
    });
  }
  int? selectedContactIndex;
  void _onContactPressed(int index) {
    setState(() {
      selectedContactIndex = index;
    });
  }

  void _onClosePressed() {
    setState(() {
      selectedContactIndex = null;
    });
  }


  @override
  void initState() {
    //getContact();
    getAllContact();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 130,
              child: iscontact ? const Center(child: CircularProgressIndicator(),) :ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: listContact.length,
                  itemBuilder: (context,index)
                  {
                    ContactModel contact = listContact[index];
                    int? select;
                    select = int.parse(contact.id!);
                    return InkWell(
                      onTap: () {
                        openWidget(context,contact.image,contact.nom_prenom,contact.fonction,contact.telephone,contact.email,contact.groupe_nom,contact.entreprise,contact.adresse,contact.complement_adresse,contact.ville,contact.code_postal,contact.pays);
                      },
                      child: ContactDetailed(connected: true, image: contact.image!, name: contact.nom_prenom!, fonction: contact.fonction!, telephone: contact.telephone!,),
                    );
              }
            ),
            ),
            const ContactPageSelect()
          ],
        ),
      ],
    );
  }
}

Widget _buildRowIcon(IconData icon) {
  return Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
      color:TColors.bg,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: Colors.grey[300]!,
        width: 0.5,
      ),
    ),
    child: IconButton(
      onPressed: () {},
      icon: Icon(
        icon,
        size: 14,
        color: Colors.grey,
      ),
    ),
  );
}


