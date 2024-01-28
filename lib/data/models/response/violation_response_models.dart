import 'dart:convert';

class ViolationsResponseModel {
  final String? message;
  final int? total;
  final List<Violation>? data;

  ViolationsResponseModel({
    this.message,
    this.total,
    this.data,
  });

  factory ViolationsResponseModel.fromJson(String str) =>
      ViolationsResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ViolationsResponseModel.fromMap(Map<String, dynamic> json) =>
      ViolationsResponseModel(
        message: json["message"],
        total: json["total"],
        data: json["data"] == null
            ? []
            : List<Violation>.from(
                json["data"]!.map((x) => Violation.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "total": total,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Violation {
  final int? id;
  final int? studentId;
  final String? studentName;
  final int? officerId;
  final String? officerName;
  final String? violationName;
  final int? violationsTypesId;
  final int? point;
  final String? type;
  final String? catatan;
  final int? isValidate;
  final DateTime? createdAt;

  Violation({
    this.id,
    this.studentId,
    this.studentName,
    this.officerId,
    this.officerName,
    this.violationName,
    this.violationsTypesId,
    this.point,
    this.type,
    this.catatan,
    this.isValidate,
    this.createdAt,
  });

  factory Violation.fromJson(String str) => Violation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Violation.fromMap(Map<String, dynamic> json) => Violation(
        id: json["id"],
        studentId: json["student_id"],
        studentName: json["student_name"],
        officerId: json["officer_id"],
        officerName: json["officer_name"],
        violationName: json["violation_name"],
        violationsTypesId: json["violations_types_id"],
        point: json["point"],
        type: json["type"]!,
        catatan: json["catatan"],
        isValidate: json["is_validate"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "student_id": studentId,
        "student_name": studentName,
        "officer_id": officerId,
        "officer_name": officerName,
        "violation_name": violationName,
        "violations_types_id": violationsTypesId,
        "point": point,
        "type": type,
        "catatan": catatan,
        "is_validate": isValidate,
        "created_at": createdAt?.toIso8601String(),
      };
}
