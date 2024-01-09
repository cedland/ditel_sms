import 'package:flutter/material.dart';

import '../../../../common/widgets/login/login_app_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: LoginAppBar(),
    );
  }
}
