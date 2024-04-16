import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Zibma/app.dart';
import 'package:Zibma/utils/app_constants.dart';
import 'package:Zibma/utils/network_dio/network_dio.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NetworkDioHttp.setDynamicHeader(endPoint: ApiAppConstants.apiEndPoint);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemStatusBarContrastEnforced: true,
    ),
  );
  runApp(const ZibmaApp());
}
