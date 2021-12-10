import 'dart:core';

class UserModel {
  String name;
  String email;
  String phone;
  String uId;
  bool isEmailVerified;
  String image;
  String cover;
  String bio;

  UserModel({
    this.email,
    this.phone,
    this.name,
    this.uId,
    this.isEmailVerified,
    this.image,
    this.cover,
    this.bio,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
    image = json['image'];
    bio = json['bio'];
    cover = json['cover'];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
      'image': image,
      'bio': bio,
      'cover': cover,
    };
  }
}
