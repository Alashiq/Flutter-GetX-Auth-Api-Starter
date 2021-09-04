import 'package:get/get.dart';

class AuthController extends GetxController{
  int count =5;

  void plus(){
    count++;
    print(count);
    update();
  }

  void mins(){
    count--;
  }
}