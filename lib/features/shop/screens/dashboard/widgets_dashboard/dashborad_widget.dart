import 'package:ditel_sms_app/features/shop/screens/dashboard/widgets/accueil_title_widget.dart';
import 'package:ditel_sms_app/features/shop/screens/dashboard/widgets/grid_item.dart';
import 'package:ditel_sms_app/features/shop/screens/dashboard/widgets/meeting_widget.dart';
import 'package:ditel_sms_app/features/shop/screens/dashboard/widgets/contact_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/dashboard_app_bar.dart';
import '../../../../../common/widgets/dashboard/text_trois.dart';
import '../../../../../data/dummy_data.dart';
import '../../../../../utils/constants/colors.dart';
import '../widgets/top_user.dart';
class DashboardWidget extends StatelessWidget {
  const DashboardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              AccueilTitleWidget(color: TColors.bgboutton, width: 2 * (MediaQuery.of(context).size.width / 3), textprincipal: 'Organisez vos campagnes marketing', textsecond: 'Ditel SMS vous permet d’envoyer des messages à vos', principalcolor: TColors.bg, secondcolor: TColors.blancopac, textsecond2: 'contacts en utilisant la carte SIM de votre opérateur', image: 'assets/images/Illustration.png',),
              //const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: ((MediaQuery.of(context).size.height - 80) / 4 * 3 ) ,
                  width: 2 * (MediaQuery.of(context).size.width / 3),
                  //color: Colors.red,
                  margin: const EdgeInsets.only(right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        //padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color.fromARGB(100, 158, 158, 158),
                            width: 0.5,
                          ),
                        ),
                        margin: const EdgeInsets.only(bottom:10),
                        width: MediaQuery.of(context).size.width / 3 -12,
                        height: 480,
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            TextTrois(text: 'Prochaines campagnes', color: TColors.title, text2: 'Le planning de vos futurs envois',color2: TColors.txtbouttongreydark,icon: Icons.calendar_month,onPressed: (){}, text3: 'Voir tout',),
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: upcomingEvents.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: MeetingWidget(event: upcomingEvents[index]),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Container(
                              //padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                // color: Colors.blue,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: const Color.fromARGB(100, 158, 158, 158),
                                  width: 0.5,
                                ),
                              ),
                              // margin: const EdgeInsets.only(right: 50),
                              margin: const EdgeInsets.only(bottom:10),
                              width: MediaQuery.of(context).size.width / 3 -12,
                              height: (((MediaQuery.of(context).size.height - 80) / 4 * 3) / 2) -16,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TextTrois(text: 'Actions rapides', color: TColors.title, text2: 'Créer un client ou une campagne',color2: TColors.txtbouttongreydark,text3: '',),
                                  const SizedBox(height: 20),
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                        margin: const EdgeInsets.all(15),
                                        child: GridView(
                                          gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 4,
                                            crossAxisSpacing: 15,
                                            mainAxisSpacing: 15,
                                          ),
                                          physics:
                                          const NeverScrollableScrollPhysics(),
                                          children:  const [
                                            GridItem(
                                                icon: Icons.computer,
                                                text:
                                                "Créer une campagne"),
                                            GridItem(
                                                icon: Icons.people,
                                                text:
                                                "Créer un contact"),
                                            GridItem(
                                                icon: Icons
                                                    .message_rounded,
                                                text:
                                                "Envoyer un message"),
                                            GridItem(
                                                icon: Icons
                                                    .drive_folder_upload,
                                                text:
                                                "Créer un groupe"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 2,),
                          Container(
                            //padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              //color: Colors.blue,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color.fromARGB(100, 158, 158, 158),
                                width: 0.5,
                              ),
                            ),
                            // margin: const EdgeInsets.only(right: 50),
                            margin: const EdgeInsets.only(bottom:10),
                            width: MediaQuery.of(context).size.width / 3 -12,
                            height: (((MediaQuery.of(context).size.height - 80) / 4 * 3) / 2) -9,

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextTrois(text: 'Top users', color: TColors.title, text2: 'Week to week performance',color2: TColors.txtbouttongreydark,icon: Icons.leaderboard,onPressed: (){}, text3: 'All reports',),
                                Expanded(
                                  child: ListView.builder(
                                    //physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: contacts.length,
                                    itemBuilder:
                                        (context, index) {
                                      return InkWell(
                                        onTap: () {},
                                        child: TopUsers(
                                            contact:
                                            contacts[index]),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 10),
                  child: TextTrois(text: 'Derniers contacts', color: TColors.title, text2: 'Vos contacts récemment ajoutés',color2: TColors.txtbouttongreydark,text3: '',),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  width: MediaQuery.of(context).size.width / 4.5 -20,
                  height: MediaQuery.of(context).size.height - 160,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child:
                        ContactWidget(contact: contacts[index], connect: contacts[index].connect,),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}