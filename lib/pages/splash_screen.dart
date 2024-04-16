import 'dart:async';

import 'package:Zibma/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:Zibma/app.dart';
import 'package:Zibma/components/app_asset.dart';
import 'package:Zibma/components/colors.dart';
import 'package:Zibma/utils/app_constants.dart';
import 'package:Zibma/utils/network_dio/network_dio.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      startTime();
    });
  }

  startTime() async {
    return Timer(
      const Duration(milliseconds: 1500),
      () {
        Get.offAll(
          () => const UserPage(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: redColor,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: redColor,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Center(
            child: SvgPicture.asset(
              AppAsset.logo,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
