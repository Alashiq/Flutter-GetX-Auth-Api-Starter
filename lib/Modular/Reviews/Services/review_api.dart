import 'dart:convert';
import 'package:flutterauthgetxstarter/Modular/Auth/Models/user.dart';
import 'package:flutterauthgetxstarter/Utils/api.dart';
import 'package:http/http.dart' as http;


class AuthApi extends SharedApi {
  // Login API
  Future<UserModel?> loginAPI(String username, String password) async {
    try {
      // String? token = getToken();
      // if (token != null) print(token);
      var jsonData;
      var data = await http.post(
        Uri.parse(baseUrl + 'login'),
        body: {'username': username, 'password': password},
      );
      print(data.statusCode);
      if (data.statusCode == 200) {
        jsonData = json.decode(data.body);
        jsonData['user']['status'] = 200;
        return UserModel.fromJson(jsonData['user']);
      } else {
        return UserModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      return UserModel.fromJson({"status": 404});
    }
  }

  // Check Token API
    Future<UserModel?> checkTokenApi(String token) async {
    try {
      var headers = {"Authorization": "Bearer " + token,};
      var jsonData;
      var data = await http.get(Uri.parse(baseUrl + 'auth'), headers: headers);
      print(data.statusCode);
      if (data.statusCode == 200) {
        jsonData = json.decode(data.body);
        jsonData['user']['status'] = 200;
        jsonData['user']['token'] = token;
        return UserModel.fromJson(jsonData['user']);
      } else {
        return UserModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      return UserModel.fromJson({"status": 404});
    }
  }
}
