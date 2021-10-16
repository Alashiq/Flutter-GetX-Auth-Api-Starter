
class UserModel {
  final int? status;  // 200 - 204 - 400 - 404
  final String? phone;
  String? firstname;
  String? lastname;
  final bool? gender;  // true mail - false fmail
  String? photo;
  final String? token;


  UserModel({this.status,this.phone, this.firstname, this.lastname, this.gender, this.photo, this.token});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    if(jsonData['gender']==1||jsonData['gender']=='1')
    jsonData['gender']=true;
    else
    jsonData['gender']=false;
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

