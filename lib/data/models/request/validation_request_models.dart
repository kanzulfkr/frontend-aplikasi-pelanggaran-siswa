import 'dart:convert';

class ValidationRequestModel {
  final int isValidate;

  ValidationRequestModel({
    required this.isValidate,
  });

  factory ValidationRequestModel.fromJson(String str) =>
      ValidationRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ValidationRequestModel.fromMap(Map<String, dynamic> json) =>
      ValidationRequestModel(
        isValidate: json["is_validate"],
      );

  Map<String, dynamic> toMap() => {
        "is_validate": isValidate,
      };
}
