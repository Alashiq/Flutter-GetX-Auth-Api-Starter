import 'package:flutterauthgetxstarter/Modular/Auth/Models/user.dart';
import 'package:flutterauthgetxstarter/Modular/Auth/Services/auth_api.dart';
import 'package:flutterauthgetxstarter/View/Screens/Home/home_screen.dart';
import 'package:flutterauthgetxstarter/View/Widgets/loading/loading.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  UserModel? user;

  bool loginScreen=false;



  Future login(String usernameIn, String passwordIn) async {
    loginScreen=false;
    update();
    showLoading();
    user = await AuthApi().loginAPI(usernameIn, passwordIn);
    stopLoading();
    if (user!.status == 404) {
      print("no internet 404");
      loginScreen=true;
      update();
    }else if (user!.status == 200) {
      print("success");
      print(user!.name);
      Get.toNamed("/home");
    } else
      print("someting wrong 400");

  }
}


















  
  // String token="sdfsdf";
  // int count = 5;

  // void plus() {
  //   count++;
  //   print(count);
  //   update();
  // }

  // void mins() {
  //   count--;
  // }