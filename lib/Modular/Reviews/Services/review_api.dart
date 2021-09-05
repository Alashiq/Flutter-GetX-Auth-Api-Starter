import 'dart:convert';
import 'package:flutterauthgetxstarter/Modular/Reviews/Models/review.dart';
import 'package:flutterauthgetxstarter/Utils/api.dart';
import 'package:http/http.dart' as http;

class ReviewApi extends SharedApi {
  // Load All Reivews API
  Future<List<ReviewModel>?> loadReviewsAPI(String token) async {
    try {
      var headers = {
        "Authorization": "Bearer " + token,
      };
      var jsonData;
      var data =
          await http.get(Uri.parse(baseUrl + 'review'), headers: headers);
      print(data.statusCode);
      if (data.statusCode == 200) {
        jsonData = json.decode(data.body);
        return jsonData['data']
            .map<ReviewModel>((data) => ReviewModel.fromJson(data))
            .toList();
      } else {
        return jsonData['data']
            .map<ReviewModel>((data) => ReviewModel.fromJson(data))
            .toList();
      }
    } on Exception catch (_) {
      return [].map<ReviewModel>((data) => ReviewModel.fromJson(data)).toList();
    }
  }
}
