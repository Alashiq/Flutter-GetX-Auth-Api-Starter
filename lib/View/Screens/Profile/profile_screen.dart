import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthgetxstarter/Modular/Auth/Controllers/auth_controller.dart';
import 'package:flutterauthgetxstarter/Modular/Reviews/Controller/review_controller.dart';
import 'package:flutterauthgetxstarter/Utils/api.dart';
import 'package:flutterauthgetxstarter/View/Widgets/AutoLoad/auto_load.dart';
import 'package:flutterauthgetxstarter/View/Widgets/BottomBar/bottom_bar.dart';
import 'package:flutterauthgetxstarter/View/Widgets/NoNetwork/no_network.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  // AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return AutoLoad(
        onInit: (){},
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
                          child:CachedNetworkImage(imageUrl: "https://cloudsoft.ly" + controller.user!.photo!,height: 120,width: 120,),
                        
                        ),
                        SizedBox(height: 50),
                        Text(controller.user!.firstname!+" "+controller.user!.lastname!),
                        
                        SizedBox(height: 50),
                        Text(controller.user!.phone!),
                        
                        SizedBox(height: 50),
                        Text(controller.user!.gender!.toString()),
                        SizedBox(height: 50),
                        ElevatedButton(onPressed: (){
                          Get.toNamed("/changePassword");
                        }, child: Text("Change Password"),),
                      ],
                    ),
                  )
      
          ),
          bottomNavigationBar: BottomMenu(active:5,),
        ),
    );
  }
}
