import 'dart:convert';

class ViolationRequestModel {
  final int? violationsTypesId;
  final int? studentId;
  final int? officerId;
  final String? catatan;
  final int? isValidate;

  ViolationRequestModel({
    required this.violationsTypesId,
    required this.studentId,
    required this.officerId,
    required this.catatan,
    required this.isValidate,
  });

  factory ViolationRequestModel.fromJson(String str) =>
      ViolationRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ViolationRequestModel.fromMap(Map<String, dynamic> json) =>
      ViolationRequestModel(
        violationsTypesId: json["violations_types_id"],
        studentId: json["student_id"],
        officerId: json["officer_id"],
        catatan: json["catatan"],
        isValidate: json["is_validate"],
      );

  Map<String, dynamic> toMap() => {
        "violations_types_id": violationsTypesId,
        "student_id": studentId,
        "officer_id": officerId,
        "catatan": catatan,
        "is_validate": isValidate,
      };
}
