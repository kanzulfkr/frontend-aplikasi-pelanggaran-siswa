import 'dart:convert';

class UserPointResponseModel {
  final String message;
  final Point point;

  UserPointResponseModel({
    required this.message,
    required this.point,
  });

  factory UserPointResponseModel.fromJson(String str) =>
      UserPointResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserPointResponseModel.fromMap(Map<String, dynamic> json) =>
      UserPointResponseModel(
        message: json["message"],
        point: Point.fromMap(json["point"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "point": point.toMap(),
      };
}

class Point {
  final int userId;
  final String name;
  final String nisn;
  final int violationTotal;
  final int pointTotal;
  final String status;
  final List<Violation> violations;

  Point({
    required this.userId,
    required this.name,
    required this.nisn,
    required this.violationTotal,
    required this.pointTotal,
    required this.status,
    required this.violations,
  });

  factory Point.fromJson(String str) => Point.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Point.fromMap(Map<String, dynamic> json) => Point(
        userId: json["user_id"],
        name: json["name"],
        nisn: json["nisn"],
        violationTotal: json["violation_total"],
        pointTotal: json["point_total"],
        status: json["status"],
        violations: List<Violation>.from(
            json["violations"].map((x) => Violation.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "name": name,
        "nisn": nisn,
        "violation_total": violationTotal,
        "point_total": pointTotal,
        "status": status,
        "violations": List<dynamic>.from(violations.map((x) => x.toMap())),
      };
}

class Violation {
  final int id;
  final String studentName;
  final String officerName;
  final String violationsTypesName;
  final int point;
  final String type;
  final String? catatan;
  final int isValidate;
  final DateTime createdAt;

  Violation({
    required this.id,
    required this.studentName,
    required this.officerName,
    required this.violationsTypesName,
    required this.point,
    required this.type,
    required this.catatan,
    required this.isValidate,
    required this.createdAt,
  });

  factory Violation.fromJson(String str) => Violation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Violation.fromMap(Map<String, dynamic> json) => Violation(
        id: json["id"],
        studentName: json["student_name"],
        officerName: json["officer_name"],
        violationsTypesName: json["violations_types_name"],
        point: json["point"],
        type: json["type"],
        catatan: json["catatan"],
        isValidate: json["is_validate"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "student_name": studentName,
        "officer_name": officerName,
        "violations_types_name": violationsTypesName,
        "point": point,
        "type": type,
        "catatan": catatan,
        "is_validate": isValidate,
        "created_at": createdAt.toIso8601String(),
      };
}
