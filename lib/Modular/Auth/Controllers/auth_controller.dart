import 'package:flutterauthgetxstarter/Modular/Auth/Models/user.dart';
import 'package:flutterauthgetxstarter/Modular/Auth/Services/auth_api.dart';
import 'package:flutterauthgetxstarter/Utils/shared_preferences.dart';
import 'package:flutterauthgetxstarter/View/Widgets/loading/loading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  UserModel? user;
  final box = GetStorage();

  bool loginScreen = false;
  bool startScreen = false;

  Future login(String usernameIn, String passwordIn) async {
    loginScreen = false;
    update();
    showLoading();
    user = await AuthApi().loginAPI(usernameIn, passwordIn);
    stopLoading();
    if (user!.status == 200) {
      await box.write("token", user!.token);
      Get.offAndToNamed("/home");
    } else if (user!.status == 404) {
      loginScreen = true;
      update();
    } else
      print("someting wrong 400");
  }

  autoLogin() async {
    startScreen = false;
    update();
    showLoading();
    //await Future.delayed(Duration(seconds: 2));
    if (box.hasData("token") == true) {
      user = await AuthApi().checkTokenApi(box.read("token"));
      stopLoading();
      print(user!.status);
      if (user!.status == 200) {
        print(user!.token);
        Get.offAndToNamed("/home");
      } else if (user!.status == 404) {
        startScreen = true;
        update();
      } else if (user!.status == 401) {
        print("expired token 401");
        box.remove("token");
        Get.offAndToNamed("/login");
      } else {
        print("someting wrong 400");
        box.remove("token");
        Get.offAndToNamed("/login");
      }
    } else {
      stopLoading();
      Get.offAndToNamed("/login");
    }
  }

  logout()async{
    Get.offAndToNamed("/login");
    box.remove("token");
    user=UserModel.fromJson({});

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