import 'dart:convert';
import 'package:flutterauthgetxstarter/Modular/Auth/Models/user.dart';
import 'package:flutterauthgetxstarter/Utils/api.dart';
import 'package:flutterauthgetxstarter/View/Widgets/loading/loading.dart';
import 'package:flutterauthgetxstarter/View/Widgets/message/errorMessage.dart';
import 'package:flutterauthgetxstarter/View/Widgets/message/internetMessage.dart';
import 'package:flutterauthgetxstarter/View/Widgets/message/successMessage.dart';
import 'package:http/http.dart' as http;

class AuthApi extends SharedApi {
  // Login API
  Future<UserModel?> loginAPI(String username, String password) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.post(
        Uri.parse(baseUrl + 'login'),
        body: {'username': username, 'password': password},
      );
      stopLoading();
      print(data.statusCode);
      if (data.statusCode == 200) {
        jsonData = json.decode(data.body);
        jsonData['user']['status'] = 200;
        return UserModel.fromJson(jsonData['user']);
      } else {
        showErrorMessage("إسم المستخدم او كلمة المرور غير صحيحة");
        return UserModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("تحقق من إتصالك بالإنترنت");
      return UserModel.fromJson({"status": 404});
    }
  }

  // Check Token API
  Future<UserModel?> checkTokenApi(String token) async {
    try {
      var headers = {
        "Authorization": "Bearer " + token,
      };
      var jsonData;
      showLoading();
      var data = await http.get(Uri.parse(baseUrl + 'auth'), headers: headers);
      stopLoading();
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        jsonData['user']['status'] = 200;
        jsonData['user']['token'] = token;
        return UserModel.fromJson(jsonData['user']);
      } else if (data.statusCode == 401) {
        showErrorMessage(jsonData['message']);
        return UserModel.fromJson({"status": data.statusCode});
      } else {
        showErrorMessage("حدث خطأ ما");
        return UserModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("تحقق من إتصالك بالإنترنت");
      return UserModel.fromJson({"status": 404});
    }
  }
}
