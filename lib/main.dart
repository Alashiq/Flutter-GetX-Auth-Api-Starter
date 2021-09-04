import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthgetxstarter/View/Screens/Home/home_screen.dart';
import 'package:flutterauthgetxstarter/View/Screens/Login/home_screen.dart';
import 'package:flutterauthgetxstarter/utils/app_binding.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX Auth Starter',
      // home: HomeScreen(),
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      initialRoute: '/',
      initialBinding: AppBinding(),
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
      ],
    );
  }
}
