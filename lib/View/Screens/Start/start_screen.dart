import 'package:flutter/material.dart';
import 'package:flutterauthgetxstarter/Modular/Auth/Controllers/auth_controller.dart';
import 'package:flutterauthgetxstarter/View/Widgets/AutoLoad/auto_load.dart';
import 'package:flutterauthgetxstarter/View/Widgets/NoNetwork/no_network.dart';
import 'package:get/get.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) => AutoLoad(
        onInit: () async {
          await controller.autoLogin();
        },
        child: Scaffold(
          body: GetBuilder<AuthController>(
          builder: (controller) => controller.startScreen == false
              ? Container(
            alignment: Alignment.center,
            child: Text("First"),
          ): NoNetwork(onInit: controller.autoLogin,),
          ),
        ),
      ),
    );
  }
}
