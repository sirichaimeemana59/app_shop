import 'dart:convert';

PestEditModel pestEditModelFromJson(String str) =>
    PestEditModel.fromJson(json.decode(str));

String pestEditModelToJson(PestEditModel data) => json.encode(data.toJson());

class PestEditModel {
  PestEditModel({
    this.name,
    this.age,
    this.photo,
    this.note,
    this.id,
  });

  String name;
  String age;
  String photo;
  String note;
  String id;

  factory PestEditModel.fromJson(Map<String, dynamic> json) => PestEditModel(
        name: json["name"] == null ? null : json["name"],
        age: json["age"] == null ? null : json["age"],
        photo: json["photo"] == null ? null : json["photo"],
        note: json["note"] == null ? null : json["note"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "age": age == null ? null : age,
        "photo": photo == null ? null : photo,
        "note": note == null ? null : note,
        "id": id == null ? null : id,
      };
}
