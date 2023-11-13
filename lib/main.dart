import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/services/services_locator.dart';
import 'data/data_resource/local_resource/data_store.dart';
import 'data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'my_app.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  // await Firebase.initializeApp();
  // await FirebaseNotificationsHandler().init();

  await DataStore.instance.init();
  BaseApiClient();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}
