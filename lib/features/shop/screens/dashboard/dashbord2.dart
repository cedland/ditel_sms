import 'package:ditel_sms_app/features/shop/screens/dashboard/widgets/accueil_title_widget.dart';
import 'package:ditel_sms_app/features/shop/screens/dashboard/widgets/copiedrawer_screen.dart';
import 'package:ditel_sms_app/features/shop/screens/dashboard/widgets/grid_item.dart';
import 'package:ditel_sms_app/features/shop/screens/dashboard/widgets/meeting_widget.dart';
import 'package:ditel_sms_app/features/shop/screens/dashboard/widgets/top_user.dart';
import 'package:ditel_sms_app/features/shop/screens/dashboard/widgets/top_user_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../common/widgets/dashboard/call_stat_widget.dart';
import '../../../../common/widgets/dashboard/text_trois_dashbord2.dart';
import 'widgets/dashboard_app_bar.dart';
import '../../../../common/widgets/dashboard/text_principal.dart';
import '../../../../common/widgets/dashboard/text_second.dart';
import '../../../../common/widgets/dashboard/text_trois.dart';
import '../../../../data/dummy_data.dart';
import '../../../../utils/constants/colors.dart';
class Dashboard2 extends StatelessWidget {
  const Dashboard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const DashboardAppBar(title: "Dashboard"),
        backgroundColor: TColors.bg,
        drawer:const DrawerScreen(),
        body: Padding(
          padding: const EdgeInsets.only(left: 86.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 25, right: 15, top: 25),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(100, 158, 158, 158),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: TColors.bgdashboard2,
                ),
                width: 409,
                height: 642,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Row(
                       // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                           margin: const EdgeInsets.all(30),
                            //height: 116,
                            //width: 250,
                            //color: Colors.red,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 15),
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.asset("assets/images/dashboard/img8.png",fit: BoxFit.fill,width: 80,height: 80,),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 25,),
                               Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Hello,',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: TColors.txtbouttongreydark, fontSize: 14)),
                                          Text('Johanna Stevens', style: Theme.of(context).textTheme.displayLarge!.copyWith(color: TColors.title, fontSize: 16,fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Check these stats below in ',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: TColors.txtbouttongreydark, fontSize: 12)),
                                        Text('case you have missed  ',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: TColors.txtbouttongreydark, fontSize: 12)),
                                      ],
                                    )
                                  ],
                                )

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      indent: 45,
                      endIndent: 45,
                    ),
                    const CallStatWidget(text1: 'Call minutes', text2: 'Total time spent', text3: '10.345', color: Colors.green, percent: 1.0,),
                    const CallStatWidget(text1: 'Conference calls', text2: 'Total time spent', text3: '31.500', color: Colors.orange, percent: 0.3,),
                    const CallStatWidget(text1: 'Call members', text2: 'Total call participants', text3: '248', color: Colors.orange, percent: 0.7,),
                    const SizedBox(height: 25,),
                    const Divider(
                      indent: 45,
                      endIndent: 45,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
                          child: TextTroisDashbord2(text: 'Most active users', color: TColors.title, text2: 'Week to week performance',color2: TColors.txtbouttongreydark,icon: Icons.message,onPressed: (){}, text3: 'Messages',),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 10, 20, 0),
                          //width: MediaQuery.of(context).size.width / 4.5 -20,
                          height: MediaQuery.of(context).size.height - 542,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: contacts.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child:TopUsersHorizontal(contact: contacts[index])
                                //ContactWidget(contact: contacts[index], connect: contacts[index].connect,),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  AccueilTitleWidget(color: TColors.bg, width: (2 * (MediaQuery.of(context).size.width / 3) -65), textprincipal: 'Your teammates are online', textsecond: 'Schedule your call, conference meeting or start a new chats ', principalcolor: TColors.title, secondcolor: TColors.txtbouttongreydark, textsecond2: 'with a welcome message', image: 'assets/images/Illustration.png',),
                  Expanded(
                    child: Container(
                      height: (MediaQuery.of(context).size.height - 80) / 4 * 3 ,
                      //width: 2 * (MediaQuery.of(context).size.width / 3),
                        width: (2 * (MediaQuery.of(context).size.width / 3) -65),
                      //color: Colors.red,
                      margin: EdgeInsets.only(right: 12,top: 10,bottom: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            //padding: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                             //  color: Colors.blue,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color.fromARGB(100, 158, 158, 158),
                                width: 0.5,
                              ),
                            ),
                            margin: const EdgeInsets.only(bottom:10),
                            width: MediaQuery.of(context).size.width / 3 -43,
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
                              Container(
                                //padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  //color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: const Color.fromARGB(100, 158, 158, 158),
                                    width: 0.5,
                                  ),
                                ),
                                // margin: const EdgeInsets.only(right: 50),
                                margin: const EdgeInsets.only(bottom:5),
                                width: MediaQuery.of(context).size.width / 3 -43,
                                height: (((MediaQuery.of(context).size.height - 80) / 4 * 3) / 2) -19.5,

                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    const TextTrois(text: 'Actions rapides', color: TColors.title, text2: 'Créer un client ou une campagne',color2: TColors.txtbouttongreydark, text3: '',),
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
                                            children:  [
                                              GridItem(
                                                  icon: Icons.computer,
                                                  text:
                                                  "Créer une campagne", ontap: () {  },),
                                              GridItem(
                                                  icon: Icons.people,
                                                  text:
                                                  "Créer un contact", ontap: () {  },),
                                              GridItem(
                                                  icon: Icons
                                                      .message_rounded,
                                                  text:
                                                  "Envoyer un message", ontap: () {  },),
                                              GridItem(
                                                  icon: Icons
                                                      .drive_folder_upload,
                                                  text:
                                                  "Créer un groupe", ontap: () {  },),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                //padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  //color: Colors.green,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: const Color.fromARGB(100, 158, 158, 158),
                                    width: 0.5,
                                  ),
                                ),
                                // margin: const EdgeInsets.only(right: 50),
                                margin: const EdgeInsets.only(bottom:10),
                                width: MediaQuery.of(context).size.width / 3 -43,
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
            ],
          ),
        )
    );
  }
}








