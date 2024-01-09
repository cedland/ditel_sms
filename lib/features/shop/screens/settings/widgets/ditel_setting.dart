import 'package:flutter/material.dart';

import '../../../../../common/widgets/login/text_form_field.dart';
import '../../../../../utils/constants/colors.dart';
import '../../contacts/widgets/boutton_contact.dart';
import 'boutton_settings.dart';
import 'container_radio.dart';

class DitelSetting extends StatefulWidget {
  const DitelSetting({
    super.key,
  });

  @override
  State<DitelSetting> createState() => _DitelSettingState();
}

class _DitelSettingState extends State<DitelSetting> {
  bool? check1 = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height - 80,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  child: Text(
                    "Paramètres DITEL",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                        fontFamily: "LatoBold", fontSize: 16),
                  ),
                ),
                ContainerRadio(text1: 'SMSpro', text2: 'Clever', trois: true,text3:'Modem SMS', groupeValue: "mode1", text: 'Mode utilisation',)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TextFormFieldWidget(label: "Vitesse (Bauds)",icon: Icons.speed,hintext:"Entrer la vitesse",width: 304,color: TColors.txtbouttongreydark,),
                  const SizedBox(width: 30,),
                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(8),
                      color: const Color.fromARGB(
                          255, 107, 89, 204),
                    ),
                    child: TextButton(
                      onPressed: (){},
                      child: Text(
                        "Défaut",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                            color: Colors.white,
                        fontFamily: "LatoBold"),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              height: 150,
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 320,
                      child: ContainerRadio(text1: 'SMSpro', text2: 'Clever', trois: true,text3:'Modem SMS', groupeValue: 'mode2', text: 'Parité',)),
                  const SizedBox(width: 10,),
                  SizedBox(
                      width: 320,
                      child: ContainerRadio(text1: '7', text2: '8', trois: false, groupeValue: 'mode3', text: 'Nb de bits de données',)),
                  const SizedBox(width: 10,),
                  SizedBox(
                      width: 320,
                      child: ContainerRadio(text1: '1', text2: '1.5', trois: true,text3:'2', groupeValue: 'mode4', text: 'Nb de bits de stop',))
                ],
              )
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox( //only check box
                      value: check1, //unchecked
                      onChanged: (bool? value){
                        //value returned when checkbox is clicked
                        setState(() {
                          check1 = value;
                        });
                      }
                  ),
                  const SizedBox(width: 10,),
                  Text("Mode debug : visu de commandes et réponses", style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 14, color: TColors.title,fontFamily: "LatoBold"))
                ],
              ),
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormFieldWidget(label: "N° du port série (1 à 32) :",icon: Icons.numbers,hintext:"Entrer le N° du port",width: 304,color: TColors.txtbouttongreydark,),
                ],
              ),
            ),
            BouttonSetting(onPressed1: () {}, onPressed2: () {})
          ],
        ),
      ),
    );
  }
}

