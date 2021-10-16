import 'package:flutterauthgetxstarter/Modular/Auth/Controllers/auth_controller.dart';
import 'package:get/get.dart';

class SharedApi {
  String imageUrl = "http://192.168.0.103:8000";
  String baseUrl = "http://192.168.0.103:8000/api/app/";

  Map<String, String> getToken() {
    AuthController authController = Get.find();
    String? token = authController.user!.token;
    if (token != null)
      return {
        "Authorization": "Bearer " + token,
      };
    return {
      "Authorization": "Bearer " + "BadToken",
    };
  }
}
