import 'package:flutterauthgetxstarter/Modular/Reviews/Models/review.dart';

class ReviewListItemModel {
  final int? id;
  final String? name;
  final String? job;
  final String? photo;

  ReviewListItemModel({this.id, this.name, this.job, this.photo});

  factory ReviewListItemModel.fromJson(Map<String, dynamic> jsonData) {
    return ReviewListItemModel(
      id: jsonData['id'],
      name: jsonData['name'],
      job: jsonData['job'],
      photo: jsonData['photo'],
    );
  }
}

class ReviewListModel {
  final int? status; // 200 - 204 - 400 - 404
  final List<ReviewListItemModel>? items;

  ReviewListModel({this.status, this.items});

  factory ReviewListModel.fromJson(Map<String, dynamic> jsonData) {
    return ReviewListModel(
        status: jsonData['status'],
        items: jsonData['items']
            .map<ReviewModel>((data) => ReviewModel.fromJson(data))
            .toList());
  }
}
