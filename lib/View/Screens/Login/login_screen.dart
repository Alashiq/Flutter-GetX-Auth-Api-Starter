import 'package:flutter/material.dart';
import 'package:flutterauthgetxstarter/Modular/Auth/Controllers/auth_controller.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final phoneIn = TextEditingController();
    final passwordIn = TextEditingController();
    phoneIn.text = "0926503011";
    passwordIn.text = "123456";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: GetBuilder<AuthController>(
          builder: (controller) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: phoneIn,
              ),
              TextField(
                controller: passwordIn,
              ),
              GetBuilder<AuthController>(
                  builder: (controller) => ElevatedButton(
                      onPressed: () async {
                        await controller.login(
                            phoneIn.text, passwordIn.text);
                      },
                      child: Text("Login"))),
            ],
          ),
        ),
      ),
    );
  }
}
