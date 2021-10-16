import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthgetxstarter/View/Screens/ChangePassword/change_password.dart';
import 'package:flutterauthgetxstarter/View/Screens/Home/home_screen.dart';
import 'package:flutterauthgetxstarter/View/Screens/Login/login_screen.dart';
import 'package:flutterauthgetxstarter/View/Screens/Start/start_screen.dart';
import 'package:flutterauthgetxstarter/utils/app_binding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'View/Screens/Profile/profile_screen.dart';
import 'View/Screens/Register/register_screen.dart';

void main() async {
  await GetStorage.init();
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
        GetPage(name: '/', page: () => StartScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
        GetPage(name: '/changePassword', page: () => ChangePasswordScreen()),
      ],
    );
  }
}
