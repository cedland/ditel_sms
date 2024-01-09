import 'package:ditel_sms_app/features/shop/screens/appbar/widgets/action_widget_contact.dart';
import 'package:ditel_sms_app/features/shop/screens/appbar/widgets/action_widget_dashboard.dart';
import 'package:ditel_sms_app/features/shop/screens/appbar/widgets/action_widget_evenement.dart';
import 'package:ditel_sms_app/features/shop/screens/appbar/widgets/action_widget_message.dart';
import 'package:ditel_sms_app/features/shop/screens/appbar/widgets/action_widget_nouvelle_campagne.dart';
import 'package:ditel_sms_app/features/shop/screens/appbar/widgets/action_widget_settings.dart';
import 'package:ditel_sms_app/features/shop/screens/appbar/widgets/title_widget_contact.dart';
import 'package:ditel_sms_app/features/shop/screens/appbar/widgets/title_widget_dashboard.dart';
import 'package:ditel_sms_app/features/shop/screens/appbar/widgets/title_widget_evenement.dart';
import 'package:ditel_sms_app/features/shop/screens/appbar/widgets/title_widget_message.dart';
import 'package:ditel_sms_app/features/shop/screens/appbar/widgets/title_widget_nouvelle_campagne.dart';
import 'package:ditel_sms_app/features/shop/screens/appbar/widgets/title_widget_settings.dart';

import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class DitelAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DitelAppBar({
    super.key,
    required this.title,
    this.additionalIcon,
    this.additionalFunction,
    this.saveUnfinishedOrder,
    required this.pageId,
    required this.ajoutContact,
    required this.titresimple,
    required this.search,
    required this.showsearch,
  });


  final String title;
  final IconData? additionalIcon;
  final Function()? additionalFunction;
  final Function()? saveUnfinishedOrder;
  final int pageId;
  final Function() ajoutContact;
  final bool titresimple;
  final Function() search;
  final bool showsearch;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const Border(
          bottom: BorderSide(
              color: TColors.txtbouttongrey,
              width: 1
          )
      ),
      elevation: 0,
      actions: [
        Container(
          margin: const EdgeInsets.all(4),
          alignment: Alignment.center,
          width: 400,
          decoration: const BoxDecoration(
            //borderRadius: BorderRadius.all(Radius.circular(20)),
              color: TColors.bg
          ),
          child:
          pageId == 0 ? ActionWidgetDashboard(search:search, showsearch: showsearch,) :
          (pageId == 1 ? const ActionWidgetMessage() :
          (pageId == 2 ? ActionWidgetContact(ajoutContact: ajoutContact):
          (pageId == 3 ? const Text('') :
          (pageId == 4 ? const ActionWidgetNouvelleCampagne():
          (pageId == 5 ? const Text('') :
          (pageId == 6 ? const ActionWidgetEvenement() :
          const ActionWidgetSettings())))))),
        ),
      ],
      backgroundColor: TColors.bg,
      centerTitle: false,
      title: pageId == 0 ? const TitleWidgetDashboard() :
      (pageId == 1 ? const TitleWidgetMessage() :
      (pageId == 2 ? TitleWidgetContact(titresimple: titresimple,):
      (pageId == 3 ? const Text('') :
      (pageId == 4 ? const TitleWidgetNouvelleCampagne():
      (pageId == 5 ? const Text('') :
      (pageId == 6 ? const TitleWidgetEvenement() :
      const TitleWidgetSettings())))))),
    );
  }
}





