import 'package:flutter/material.dart';
import 'package:flutterauthgetxstarter/Modular/Auth/Controllers/auth_controller.dart';
import 'package:flutterauthgetxstarter/View/Widgets/AutoLoad/auto_load.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final oldPasswordIn = TextEditingController();
    final newPasswordIn = TextEditingController();
    return AutoLoad(
        onInit: () {},
        child: Scaffold(
          appBar: AppBar(
            title: Text("تغيير كلمة المرور"),
            centerTitle: true,
          ),
          body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                TextField(
                  controller: oldPasswordIn,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: newPasswordIn,
                ),
                SizedBox(height: 20),
                GetBuilder<AuthController>(
                  builder: (controller) => ElevatedButton(
                    onPressed: () async {
                      await controller.changePassword(
                          oldPasswordIn.text, newPasswordIn.text);
                    },
                    child: Text("Update Your Password"),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
