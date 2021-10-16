

class ReviewModel {
  final int? id;
  final String? name;
  final String? job;
  final String? photo;


  ReviewModel({this.id, this.name, this.job, this.photo});

  factory ReviewModel.fromJson(Map<String, dynamic> jsonData) {
    return ReviewModel(
        id: jsonData['id'],
        name: jsonData['name'],
        job: jsonData['job'],
        photo: jsonData['photo'],
        );
  }
}



class ReviewListModel {
  final int? status;  // 200 - 204 - 400 - 404
  final List<ReviewModel>? items;

  ReviewListModel({this.status,this.items});

  factory ReviewListModel.fromJson(Map<String, dynamic> jsonData) {
    return ReviewListModel(
        status: jsonData['status'],
        items:  jsonData['items']
              .map<ReviewModel>((data) => ReviewModel.fromJson(data))
              .toList()
        );
  }
}

