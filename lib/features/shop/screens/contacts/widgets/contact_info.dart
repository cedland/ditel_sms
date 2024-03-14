import 'package:ditel_sms_app/features/shop/screens/contacts/widgets/social_boutton.dart';
import 'package:flutter/material.dart';
import '../../../../../classes/contact.dart';
import '../../../../../utils/constants/colors.dart';
import 'infos_contact_widget.dart';


class ContactInfo extends StatelessWidget {
  const ContactInfo(
      {super.key,required this.onClosePressed,required this.image, required this.name, required this.fonction, required this.telephone, required this.email, required this.groupe, required this.adresse, required this.complement, required this.cp, required this.pays, required this.ville});

  //final Contact contact;
  final VoidCallback onClosePressed;
  final String image;
  final String name;
  final String fonction;
  final String telephone;
  final String email;
  final String groupe;
  final String adresse;
  final String complement;
  final String cp;
  final String pays;
  final String ville;


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
                      child:
                        Image.network(
                          image,
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
                    name,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                          color: TColors.title,
                          fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "LatoBold")
                  ),
                  Text(
                    fonction,
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
            InfoContact(text: 'Tel', bouton:true, value:telephone,),
            InfoContact(text: 'Email', bouton: false, value: email,),
            InfoContact(text: 'Groupe', bouton: false, value: groupe,),
            InfoContact(text: 'Entreprise', bouton: false, value: fonction,),
            InfoContact(text: 'Adresse', bouton: false, value: adresse,),
            InfoContact(text: 'Complément', bouton: false, value:complement,),
            InfoContact(text: 'Code postal', bouton: false, value:cp,),
            InfoContact(text: 'Ville', bouton: false, value:ville,),
            InfoContact(text: 'Pays', bouton: false, value: pays,),
            //const SizedBox(height: 30,),
            const SizedBox(height: 40,),

            const SocialButton()
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
