import 'package:flutterauthgetxstarter/Modular/Auth/Controllers/auth_controller.dart';
import 'package:flutterauthgetxstarter/Modular/Auth/Controllers/news_controller.dart';
import 'package:flutterauthgetxstarter/Modular/Reviews/Controller/review_controller.dart';
import 'package:get/get.dart';


class AppBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<ReviewController>(ReviewController());
    Get.put<NewsController>(NewsController());
  }

}