import 'dart:convert';
import 'package:flutterauthgetxstarter/Modular/Reviews/Models/review_list.dart';
import 'package:flutterauthgetxstarter/Utils/api.dart';
import 'package:http/http.dart' as http;

class ReviewApi extends SharedApi {
  // Load All Reivews API
  Future<ReviewListModel> loadReviewsAPI() async {
    try {
      var data =
          await http.get(Uri.parse(baseUrl + 'review'), headers: getToken());
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);
        return ReviewListModel.fromJson(
            {"status": 200, "items": jsonData['data']});
      } else {
        return ReviewListModel.fromJson(
            {"status": data.statusCode, "items": []});
      }
    } on Exception catch (_) {
      return ReviewListModel.fromJson({"status": 404, "items": []});
    }
  }
}
