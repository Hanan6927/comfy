import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  int? ID;
  String? Email, UserName, Password, Phonenumber;
  User(
      {this.ID,
        required this.UserName,
      required this.Email,
      required this.Password,
      required this.Phonenumber});

  // factory UserRegister.fromJson(Map<String, dynamic> json) =>
  //     _$UserRegisterFromJson(json);
  // Map<String, dynamic> toJson() => _$UserRegisterToJson(this);
  User.fromJson(Map<String, dynamic> json)
      :
        ID = json["id"],
        UserName = json['username'],
        Email = json['email'],
        Password = json['pasword'],
        Phonenumber = json['phone_number'];
  Map<String, dynamic> toJson() => {
        'id':ID,
        'name': UserName,
        'email': Email,
        "phone_number": Phonenumber,
        "password": Password,
      };
}