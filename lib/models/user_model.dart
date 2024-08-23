class UserModel {
  String? id;
  String? userName;
  String? email;
  String? password;
  String? profileImg;
  String? bio;
  String? fcmToken;
  bool? isAccepted;
  String? timeStamp;

  UserModel({
    this.id,
    this.userName,
    this.email,
    this.password,
    this.profileImg,
    this.bio,
    this.fcmToken,
    this.isAccepted,
    this.timeStamp,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    profileImg = json['profileImg'];
    bio = json['bio'];
    fcmToken = json['fcmToken'];
    isAccepted = json['isAccepted'];
    timeStamp = json['timeStamp'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['userName'] = userName;
    json['email'] = email;
    json['password'] = password;
    json['profileImg'] = profileImg;
    json['bio'] = bio;
    json['fcmToken'] = fcmToken;
    json['isAccepted'] = isAccepted;
    json['timeStamp'] = timeStamp;

    return json;
  }
}
