import 'dart:convert';
import 'package:flutterauthgetxstarter/Modular/Auth/Models/user.dart';
import 'package:flutterauthgetxstarter/Utils/api.dart';
import 'package:flutterauthgetxstarter/View/Widgets/loading/loading.dart';
import 'package:flutterauthgetxstarter/View/Widgets/message/errorMessage.dart';
import 'package:flutterauthgetxstarter/View/Widgets/message/internetMessage.dart';
import 'package:flutterauthgetxstarter/View/Widgets/message/successMessage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthApi extends SharedApi {
  // Login API
  Future<UserModel?> loginAPI(String phone, String password) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.post(
        Uri.parse(baseUrl + 'user/login'),
        body: {'phone': phone, 'password': password},
      );
      stopLoading();
      print(data.statusCode);
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        jsonData['user']['phone'] = phone;
        jsonData['user']['status'] = 200;
        return UserModel.fromJson(jsonData['user']);
      } else {
        showErrorMessage(jsonData['message']);
        return UserModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("تحقق من إتصالك بالإنترنت");
      return UserModel.fromJson({"status": 404});
    }
  }


    // Sign Up API
  Future<UserModel?> signupAPI(String phone,String firstName,String lastName, String password,String gender) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.post(
        Uri.parse(baseUrl + 'user/create'),
        body: {'phone': phone,'firstname':firstName,'lastname':lastName, 'password': password,'gender':gender},
      );
      stopLoading();
      print(data.statusCode);
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        jsonData['user']['phone'] = phone;
        jsonData['user']['status'] = 200;
        return UserModel.fromJson(jsonData['user']);
      } else {
        showErrorMessage(jsonData['message']);
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
      var data =
          await http.get(Uri.parse(baseUrl + 'user/auth'), headers: headers);
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

// Change Password API
  Future<int> chagnePasswordAPI(String oldPassword, String newPassword) async {
    try {
      showLoading();
      var data = await http.put(Uri.parse(baseUrl + 'user'),
          body: {'oldPassword': oldPassword, 'newPassword': newPassword},
          headers: getToken());
      stopLoading();
      var jsonData = json.decode(data.body);

      if (data.statusCode == 200) {
        showSuccessMessage(jsonData['message']);
      } else {
        showErrorMessage(jsonData['message']);
      }
      return data.statusCode;
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("تحقق من إتصالك بالإنترنت");
      return 404;
    }
  }

  // Change User Photo API
  Future<UserModel> changePhotoAPI(image) async {
    try {
      showLoading();
      var request =
          http.MultipartRequest('POST', Uri.parse(baseUrl + 'user/photo'));
      request.headers.addAll(getToken());
      request.files.add(await http.MultipartFile.fromPath('file', image.path));
      var response = await request.send();
      var data = await http.Response.fromStream(response);
      stopLoading();
      var jsonData = json.decode(data.body);

      if (data.statusCode == 200) {
        showSuccessMessage(jsonData['message']);
        jsonData['status'] = data.statusCode;
        return UserModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['message']);
        jsonData['status'] = data.statusCode;
        return UserModel.fromJson(jsonData);
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("تحقق من إتصالك بالإنترنت");
      return UserModel.fromJson({"status": 404});
    }
  }


  // Change Password API
  Future<int> chagneNameAPI(String firstName, String lastName) async {
    try {
      showLoading();
      var data = await http.put(Uri.parse(baseUrl + 'user'),
          body: {'firstname': firstName, 'lastname': lastName},
          headers: getToken());
      stopLoading();
      var jsonData = json.decode(data.body);

      if (data.statusCode == 200) {
        showSuccessMessage(jsonData['message']);
      } else {
        showErrorMessage(jsonData['message']);
      }
      return data.statusCode;
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("تحقق من إتصالك بالإنترنت");
      return 404;
    }
  }


}
