import 'package:flutter/material.dart';
import '../../../../../data/dummy_data.dart';
import '../widgets/group_widget.dart';

class ContactWidgets extends StatelessWidget {
  const ContactWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
        children: [
          GroupWidget(),
        ],
      );
  }
}