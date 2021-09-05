
class UserModel {
  final int? status;  // 200 - 204 - 400 - 404
  final int? id;
  final String? name;
  final String? username;
  final String? photo;
  final String? token;


  UserModel({this.status,this.id, this.name, this.username, this.photo, this.token});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
        status: jsonData['status'],
        id: jsonData['id'],
        name: jsonData['name'],
        username: jsonData['username'],
        photo: jsonData['photo'],
        token: jsonData['token']
        );
  }
}

