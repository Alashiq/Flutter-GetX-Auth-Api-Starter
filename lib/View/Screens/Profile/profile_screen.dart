import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthgetxstarter/Modular/Auth/Controllers/auth_controller.dart';
import 'package:flutterauthgetxstarter/Utils/api.dart';
import 'package:flutterauthgetxstarter/View/Widgets/AutoLoad/auto_load.dart';
import 'package:flutterauthgetxstarter/View/Widgets/BottomBar/bottom_bar.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  // AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    final firstNameIn = TextEditingController();
    final lastNameIn = TextEditingController();
    return AutoLoad(
      onInit: () {},
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Profile"),
          actions: [
            GetBuilder<AuthController>(
              builder: (controller) => IconButton(
                onPressed: () async {
                  await controller.logout();
                },
                icon: Icon(Icons.logout),
              ),
            )
          ],
        ),
        body: GetBuilder<AuthController>(
            builder: (controller) => Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: controller.showUserPhoto == null
                            ? CachedNetworkImage(
                                imageUrl: SharedApi().imageUrl +
                                    controller.user!.photo!,
                                height: 120,
                                width: 120,
                              )
                            : Image.file(
                                controller.showUserPhoto!,
                                height: 120,
                                width: 120,
                              ),
                      ),
                      controller.showUserPhoto == null
                          ? ElevatedButton(
                              onPressed: () async {
                                await controller.selectPhoto();
                              },
                              child: Text("Photo"),
                            )
                          : ElevatedButton(
                              onPressed: () async {
                                await controller.changePhoto();
                              },
                              child: Text("upload"),
                            ),
                      SizedBox(height: 50),
                      controller.changeName == false
                          ? Row(
                              children: [
                                Text(controller.user!.firstname! +
                                    " " +
                                    controller.user!.lastname!),
                                ElevatedButton(
                                    onPressed: () {
                                      controller.changeName=true;
                                      firstNameIn.text=controller.user!.firstname!;
                                      lastNameIn.text=controller.user!.lastname!;
                                      controller.update();
                                    }, child: Text("edit"))
                              ],
                            )
                          : Container(
                              height: 120,
                              width: 280,
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: firstNameIn,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        controller: lastNameIn,
                                      ),
                                    ),
                                    Expanded(
                                      child: GetBuilder<AuthController>(
                                          builder: (controller) =>
                                              ElevatedButton(
                                                  onPressed: () async {
                                                   bool val= await controller
                                                        .changeUserName(
                                                            firstNameIn.text,
                                                            lastNameIn.text);
                                                            if(val==true){
                                                              firstNameIn.text=controller.user!.firstname!;
                                                              lastNameIn.text=controller.user!.lastname!;
                                                            }
                                                  },
                                                  child: Text("update"))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      SizedBox(height: 50),
                      Text(controller.user!.phone!),
                      SizedBox(height: 50),
                      Text(controller.user!.gender!.toString()),
                      SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed("/changePassword");
                        },
                        child: Text("Change Password"),
                      ),
                    ],
                  ),
                )),
        bottomNavigationBar: BottomMenu(
          active: 5,
        ),
      ),
    );
  }
}
