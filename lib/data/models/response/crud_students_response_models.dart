import 'dart:convert';

class StudentsResponseModel {
  final String? message;
  final List<Datum>? data;

  StudentsResponseModel({
    this.message,
    this.data,
  });

  factory StudentsResponseModel.fromJson(String str) =>
      StudentsResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StudentsResponseModel.fromMap(Map<String, dynamic> json) =>
      StudentsResponseModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  final int? userId;
  final int? studentId;
  final String? name;
  final String? email;
  final String? roles;
  final String? nisn;
  final String? phone;
  final String? gender;
  final String? address;

  Datum({
    this.userId,
    this.studentId,
    this.name,
    this.email,
    this.roles,
    this.nisn,
    this.phone,
    this.gender,
    this.address,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        userId: json["user_id"],
        studentId: json["student_id"],
        name: json["name"],
        email: json["email"],
        roles: json["roles"],
        nisn: json["nisn"],
        phone: json["phone"],
        gender: json["gender"],
        address: json["address"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "student_id": studentId,
        "name": name,
        "email": email,
        "roles": roles,
        "nisn": nisn,
        "phone": phone,
        "gender": gender,
        "address": address,
      };
}
