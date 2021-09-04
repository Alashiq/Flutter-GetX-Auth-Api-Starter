import 'package:flutterauthgetxstarter/Modular/Auth/Controllers/auth_controller.dart';
import 'package:get/get.dart';


class SharedApi {
  String imageUrl="https://cloudsoft.ly/";
  String baseUrl="https://cloudsoft.ly/api/admin/";

  String? getToken(){
    AuthController authController = Get.find();
    String? token=   authController.user!.token;
    return token;
  }
}