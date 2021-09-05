import 'package:flutter/material.dart';
import 'package:flutterauthgetxstarter/Modular/Auth/Controllers/auth_controller.dart';
import 'package:flutterauthgetxstarter/Modular/Reviews/Controller/review_controller.dart';
import 'package:flutterauthgetxstarter/View/Widgets/AutoLoad/auto_load.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  // AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    print("all");
    return GetBuilder<ReviewController>(builder: (controller)=> AutoLoad(onInit:controller.loadReviews, 
    child: Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          GetBuilder<AuthController>(
            builder: (controller) => IconButton(
              onPressed: () async{
                await controller.logout();
              },
              icon: Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            GetBuilder<AuthController>(
              builder: (controller) => Text("value ${controller.user!.name}"),
            ),
          ],
        ),
        ),
        ),
      ),
    );
  }
}
