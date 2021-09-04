import 'package:flutter/material.dart';
import 'package:flutterauthgetxstarter/Modular/Auth/Controllers/auth_controller.dart';
import 'package:flutterauthgetxstarter/Modular/Auth/Controllers/news_controller.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  // AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    print("all");
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Container(
        child: Column(
          children: [
            GetBuilder<AuthController>(
              builder: (controller) => Text("value ${controller.count}"),
            ),
            GetBuilder<AuthController>(
              builder: (controller) => RaisedButton(onPressed: () {
                controller.plus();
              }),
            ),
                        GetBuilder<NewsController>(
              builder: (controller) => Text("value ${controller.n}"),
            ),
                        GetBuilder<NewsController>(
              builder: (controller) => RaisedButton(onPressed: () {
                controller.change();
              }),
            ),

          ],
        ),
      ),
    );
  }
}
