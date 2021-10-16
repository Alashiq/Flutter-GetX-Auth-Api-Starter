import 'dart:io';

import 'package:flutterauthgetxstarter/Modular/Auth/Models/user.dart';
import 'package:flutterauthgetxstarter/Modular/Auth/Services/auth_api.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  UserModel? user;
  final box = GetStorage();

  File? showUserPhoto;

  bool loginScreen = false;
  bool signupScreen = false;
  bool startScreen = false;
  bool changePasswordScreen = false;

  bool changeName = false;

  Future login(String phoneIn, String passwordIn) async {
    loginScreen = false;
    update();
    user = await AuthApi().loginAPI(phoneIn, passwordIn);
    if (user!.status == 200) {
      await box.write("token", user!.token);
      update();
      Get.offAndToNamed("/home");
    } else if (user!.status == 404) {
      loginScreen = true;
      update();
    }
  }

    Future signup(String phoneIn,String firstNameIn,String lastNameIn, String passwordIn, String genderIn) async {
    signupScreen = false;
    update();
    user = await AuthApi().signupAPI(phoneIn,firstNameIn,lastNameIn, passwordIn,genderIn);
    if (user!.status == 200) {
      await box.write("token", user!.token);
      update();
      Get.offAndToNamed("/home");
    } else if (user!.status == 404) {
      signupScreen = true;
      update();
    }
  }

  autoLogin() async {
    startScreen = false;
    update();
    if (box.hasData("token") == true) {
      user = await AuthApi().checkTokenApi(box.read("token"));
      if (user!.status == 200) {
        Get.offAndToNamed("/home");
      } else if (user!.status == 404) {
        startScreen = true;
        update();
      } else if (user!.status == 401) {
        box.remove("token");
        Get.offAndToNamed("/login");
      } else {
        box.remove("token");
        Get.offAndToNamed("/login");
      }
    } else {
      Get.offAndToNamed("/login");
    }
  }

  changePassword(String oldPasswordIn, String newPasswordIn) async {
    changePasswordScreen = false;
    update();
    int status =
        await AuthApi().chagnePasswordAPI(oldPasswordIn, newPasswordIn);
    if (status == 200) {
      Get.back();
    } else if (status == 404) {
      changePasswordScreen = true;
      update();
    } else if (status == 401) await logout();
  }

  logout() async {
    await Get.offAndToNamed("/login");
    box.remove("token");
    //user = UserModel.fromJson({});
    showUserPhoto = null;
    changeName = false;
    update();
  }

  selectPhoto() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? _image;
    _image = await _picker.pickImage(source: ImageSource.gallery);
    if (_image != null) {
      showUserPhoto = File(_image.path);
      update();
    }
  }

  changePhoto() async {
    UserModel? localUser = await AuthApi().changePhotoAPI(showUserPhoto);
    if (localUser.status == 200) {
      user?.photo = localUser.photo;
      showUserPhoto = null;
      update();
    }
    if (localUser.status == 401) await logout();
  }

  Future<bool> changeUserName(String firstName, String lastName) async {
    int status = await AuthApi().chagneNameAPI(firstName, lastName);
    if (status == 200) {
      changeName = false;
      if(firstName != "")
      user!.firstname=firstName;
      if(lastName != "")
      user!.lastname=lastName;
      update();
      return true;
    } else if (status == 401) await logout();
    return false;
  }
}
