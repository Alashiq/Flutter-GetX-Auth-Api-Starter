
class UserModel {
  final int? status;  // 200 - 204 - 400 - 404
  final String? phone;
  final String? firstname;
  final String? lastname;
  final int? gender;  // 1 mail - 2 fmail
  final String? photo;
  final String? token;


  UserModel({this.status,this.phone, this.firstname, this.lastname, this.gender, this.photo, this.token});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
        status: jsonData['status'],
        phone: jsonData['phone'],
        firstname: jsonData['firstname'],
        lastname: jsonData['lastname'],
        gender: jsonData['gender'],
        photo: jsonData['photo'],
        token: jsonData['token']
        );
  }
}

