
class ReviewModel {
  final int? status;  // 200 - 204 - 400 - 404
  final int? id;
  final String? name;
  final String? job;
  final String? photo;


  ReviewModel({this.status,this.id, this.name, this.job, this.photo});

  factory ReviewModel.fromJson(Map<String, dynamic> jsonData) {
    return ReviewModel(
        status: jsonData['status'],
        id: jsonData['id'],
        name: jsonData['name'],
        job: jsonData['job'],
        photo: jsonData['photo'],
        );
  }
}

