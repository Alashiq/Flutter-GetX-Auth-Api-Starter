import 'package:flutter/material.dart';
import 'package:flutterauthgetxstarter/Modular/Auth/Controllers/auth_controller.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final phoneIn = TextEditingController();
    final firstNameIn = TextEditingController();
    final lastNameIn = TextEditingController();
    final passwordIn = TextEditingController();
    final genderdIn = TextEditingController();
    phoneIn.text = "0926503011";
    passwordIn.text = "123456";
    firstNameIn.text = "الاسم";
    lastNameIn.text = "اللقب";
    genderdIn.text = "1";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Register"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: GetBuilder<AuthController>(
          builder: (controller) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Phone"),
              TextField(
                controller: phoneIn,
              ),
              Text("First Name"),
              TextField(
                controller: firstNameIn,
              ),
              Text("Last Name"),
              TextField(
                controller: lastNameIn,
              ),
              Text("Password"),
              TextField(
                controller: passwordIn,
              ),
              Text("Gender"),
              TextField(
                controller: genderdIn,
              ),
              GetBuilder<AuthController>(
                  builder: (controller) => ElevatedButton(
                      onPressed: () async {
                        await controller.signup(phoneIn.text, firstNameIn.text,
                            lastNameIn.text, passwordIn.text, genderdIn.text);
                      },
                      child: Text("Sign Up"))),
              OutlinedButton(
                onPressed: () {
                  Get.offAndToNamed("/login");
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
