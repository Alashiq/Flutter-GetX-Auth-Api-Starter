import 'package:flutter/material.dart';
import 'package:flutterauthgetxstarter/Modular/Auth/Controllers/auth_controller.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usernameIn = TextEditingController();
    final passwordIn = TextEditingController();
    usernameIn.text="alashiq";
    passwordIn.text="123123";
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Container(
        child: GetBuilder<AuthController>(
          builder: (controller) => controller.loginScreen == false
              ? Column(
                  children: [
                    TextField(
                      controller: usernameIn,
                    ),
                    TextField(
                      controller: passwordIn,
                    ),
                    GetBuilder<AuthController>(
                        builder: (controller) => ElevatedButton(
                            onPressed: () async {
                              await controller.login(
                                  usernameIn.text, passwordIn.text);
                            },
                            child: Text("Login"))),
                  ],
                )
              : Column(
                  children: [
                    Text("No Internet"),
                    GetBuilder<AuthController>(
                        builder: (controller) => ElevatedButton(
                            onPressed: () async {
                              await controller.login(
                                  usernameIn.text, passwordIn.text);
                            },
                            child: Text("Retray"))),
                  ],
                ),
        ),
      ),
    );
  }
}
