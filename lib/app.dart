import 'package:Zibma/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:Zibma/components/colors.dart';
import 'package:Zibma/pages/splash_screen.dart';

class ZibmaApp extends StatefulWidget {
  const ZibmaApp({Key? key}) : super(key: key);

  @override
  _ZibmaAppState createState() => _ZibmaAppState();
}

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "navigator");

class _ZibmaAppState extends State<ZibmaApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      title: 'Vivek',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: appBackgroundColor,
          primaryColor: Colors.red,
          primarySwatch: Colors.red,
          fontFamily: 'Urbanist',
          hintColor: primaryWhite,
          iconTheme: const IconThemeData(color: primaryBlack, size: 24)),
      // home: SplashScreen(),
      home: UserPage(),
    );
  }
}
