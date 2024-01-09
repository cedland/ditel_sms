import 'package:ditel_sms_app/features/shop/screens/contacts/widgets/social_boutton.dart';
import 'package:flutter/material.dart';
import '../../../../../classes/contact.dart';
import '../../../../../utils/constants/colors.dart';
import 'infos_contact_widget.dart';


class ContactInfo extends StatelessWidget {
  const ContactInfo(
      {super.key, required this.contact, required this.onClosePressed});

  final Contact contact;
  final VoidCallback onClosePressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3),
        //width: 400,
        padding: const EdgeInsets.all(16),
        color: TColors.bg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color.fromARGB(255, 236, 238, 245),
                    width: 1,
                  ),
                ),
                child: IconButton(
                  onPressed: onClosePressed,
                  icon: const Icon(
                    Icons.close,
                    color: Color.fromARGB(255, 128, 131, 163),
                    size: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 170.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        contact.image,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    contact.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                          color: TColors.title,
                          fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "LatoBold")
                  ),
                  Text(
                    contact.function,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                          color: TColors.txtbouttongreydark,
                          fontSize: 14,
                          fontFamily: "LatoRegular"
                      )
                  ),
                  const SizedBox(height: 10,),
                  Row(
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
                ],
              ),
            ),
            const SizedBox(height: 8),
            InfoContact(contact: contact, text: 'Tel', bouton:true, value: contact.phoneNumber[0],),
            InfoContact(contact: contact, text: 'Email', bouton: false, value: contact.email,),
            InfoContact(contact: contact, text: 'Groupe', bouton: false, value: contact.group,),
            InfoContact(contact: contact, text: 'Entreprise', bouton: false, value: contact.business,),
            InfoContact(contact: contact, text: 'Adresse', bouton: false, value: contact.address,),
            InfoContact(contact: contact, text: 'Complément', bouton: false, value: contact.complement,),
            InfoContact(contact: contact, text: 'Code postal', bouton: false, value: contact.postalCode,),
            InfoContact(contact: contact, text: 'Ville', bouton: false, value: contact.city,),
            InfoContact(contact: contact, text: 'Pays', bouton: false, value: contact.country,),

            //const SizedBox(height: 30,),
            InfoContact(contact: contact, text: 'Commentaire', bouton: false, value: contact.comment,),
            const SizedBox(height: 10,),

            SocialButton(contact: contact,)
          ],
        ),
      ),
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
