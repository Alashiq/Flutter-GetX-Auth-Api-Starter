
import 'package:flutterauthgetxstarter/Modular/Reviews/Models/review.dart';

class ReviewListModel {
  final int? status;  // 200 - 204 - 400 - 404
  final List<ReviewModel>? items;

  ReviewListModel({this.status,this.items});

  factory ReviewListModel.fromJson(Map<String, dynamic> jsonData) {
    return ReviewListModel(
        status: jsonData['status'],
        items: jsonData['data']
        );
  }
}

