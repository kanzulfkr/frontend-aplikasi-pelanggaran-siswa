import 'dart:convert';

class ViolationTypesModels {
  final int id;
  final String name;
  final String type;
  final String point;

  ViolationTypesModels({
    required this.id,
    required this.name,
    required this.type,
    required this.point,
  });

  factory ViolationTypesModels.fromJson(String str) =>
      ViolationTypesModels.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ViolationTypesModels.fromMap(Map<String, dynamic> json) =>
      ViolationTypesModels(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        point: json["point"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "type": type,
        "point": point,
      };
}
