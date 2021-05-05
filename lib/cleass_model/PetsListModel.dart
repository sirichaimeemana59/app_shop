import 'dart:convert';

List<PestListModel> pestListModelFromJson(String str) =>
    List<PestListModel>.from(
        json.decode(str).map((x) => PestListModel.fromJson(x)));

String pestListModelToJson(List<PestListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PestListModel {
  PestListModel({
    this.idPet,
    this.name,
    this.age,
    this.photo,
    this.note,
    this.updatedAt,
    this.createdAt,
  });

  int idPet;
  String name;
  int age;
  String photo;
  String note;
  DateTime updatedAt;
  DateTime createdAt;

  factory PestListModel.fromJson(Map<String, dynamic> json) => PestListModel(
        idPet: json["id_pet"] == null ? null : json["id_pet"],
        name: json["name"] == null ? null : json["name"],
        age: json["age"] == null ? null : json["age"],
        photo: json["photo"] == null ? null : json["photo"],
        note: json["note"] == null ? null : json["note"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_pet": idPet == null ? null : idPet,
        "name": name == null ? null : name,
        "age": age == null ? null : age,
        "photo": photo == null ? null : photo,
        "note": note == null ? null : note,
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}
