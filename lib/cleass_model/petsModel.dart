import 'dart:convert';

PestModel pestModelFromJson(String str) => PestModel.fromJson(json.decode(str));

String pestModelToJson(PestModel data) => json.encode(data.toJson());

class PestModel {
  PestModel({
    this.name,
    this.age,
    this.photo,
    this.note,
  });

  String name;
  String age;
  String photo;
  String note;

  factory PestModel.fromJson(Map<String, dynamic> json) => PestModel(
        name: json["name"] == null ? null : json["name"],
        age: json["age"] == null ? null : json["age"],
        photo: json["photo"] == null ? null : json["photo"],
        note: json["note"] == null ? null : json["note"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "age": age == null ? null : age,
        "photo": photo == null ? null : photo,
        "note": note == null ? null : note,
      };
}
