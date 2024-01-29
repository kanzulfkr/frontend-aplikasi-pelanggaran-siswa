import 'dart:convert';

class UserProfileResponseModel {
  final String? message;
  final Data? data;

  UserProfileResponseModel({
    this.message,
    this.data,
  });

  factory UserProfileResponseModel.fromJson(String str) =>
      UserProfileResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserProfileResponseModel.fromMap(Map<String, dynamic> json) =>
      UserProfileResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  final int? id;
  final int? studentId;
  final int? teacherId;
  final String? name;
  final String? email;
  final String? roles;
  final String? nip;
  final String? nisn;
  final String? jobTitle;
  final String? studentName;
  final String? phone;
  final String? gender;
  final String? address;

  Data({
    this.id,
    this.studentId,
    this.teacherId,
    this.name,
    this.email,
    this.roles,
    this.nip,
    this.nisn,
    this.jobTitle,
    this.studentName,
    this.phone,
    this.gender,
    this.address,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        studentId: json["student_id"],
        teacherId: json["teacher_id"],
        name: json["name"],
        email: json["email"],
        roles: json["roles"],
        nip: json["nip"],
        nisn: json["nisn"],
        jobTitle: json["job_title"],
        studentName: json["student_name"],
        phone: json["phone"],
        gender: json["gender"],
        address: json["address"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "student_id": studentId,
        "teacher_id": teacherId,
        "name": name,
        "email": email,
        "roles": roles,
        "nip": nip,
        "nisn": nisn,
        "job_title": jobTitle,
        "student_name": studentName,
        "phone": phone,
        "gender": gender,
        "address": address,
      };
}
