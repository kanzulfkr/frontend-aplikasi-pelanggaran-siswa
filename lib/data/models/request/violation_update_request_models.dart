import 'dart:convert';

class ViolationUpdateRequestModel {
  final int? id;
  final int? violationsTypesId;
  final int? studentId;
  final int? officerId;
  final String? catatan;
  final int? isValidate;

  ViolationUpdateRequestModel({
    required this.id,
    required this.violationsTypesId,
    required this.studentId,
    required this.officerId,
    required this.catatan,
    required this.isValidate,
  });

  factory ViolationUpdateRequestModel.fromJson(String str) =>
      ViolationUpdateRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ViolationUpdateRequestModel.fromMap(Map<String, dynamic> json) =>
      ViolationUpdateRequestModel(
        id: json["id"],
        violationsTypesId: json["violations_types_id"],
        studentId: json["student_id"],
        officerId: json["officer_id"],
        catatan: json["catatan"],
        isValidate: json["is_validate"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "violations_types_id": violationsTypesId,
        "student_id": studentId,
        "officer_id": officerId,
        "catatan": catatan,
        "is_validate": isValidate,
      };
}
