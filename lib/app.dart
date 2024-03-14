import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'features/shop/screens/login/sign_in_screen.dart';



class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse},
      ),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,

       home: SignInScreen(),

    );
  }
}