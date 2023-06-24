// To parse this JSON data, do
//
//     final exampleModel = exampleModelFromJson(jsonString);

import 'dart:convert';

ExampleModel exampleModelFromJson(String str) => ExampleModel.fromJson(json.decode(str));

String exampleModelToJson(ExampleModel data) => json.encode(data.toJson());

class ExampleModel {
  int? id;
  String? name;
  String? role;

  ExampleModel({
    this.id,
    this.name,
    this.role,
  });

  ExampleModel copyWith({
    int? id,
    String? name,
    String? role,
  }) =>
      ExampleModel(
        id: id ?? this.id,
        name: name ?? this.name,
        role: role ?? this.role,
      );

  factory ExampleModel.fromJson(Map<String, dynamic> json) => ExampleModel(
    id: json["id"],
    name: json["name"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "role": role,
  };
}
