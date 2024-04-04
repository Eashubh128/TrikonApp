// To parse this JSON data, do
//
//     final searchCollectionModel = searchCollectionModelFromJson(jsonString);

import 'dart:convert';

List<SearchCollectionModel> searchCollectionModelFromJson(String str) =>
    List<SearchCollectionModel>.from(
        json.decode(str).map((x) => SearchCollectionModel.fromJson(x)));

String searchCollectionModelToJson(List<SearchCollectionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchCollectionModel {
  String? id;
  String? blockSpanKey;
  String? chainType;
  String? coverImage;
  String? name;

  SearchCollectionModel({
    this.id,
    this.blockSpanKey,
    this.chainType,
    this.coverImage,
    this.name,
  });

  factory SearchCollectionModel.fromJson(Map<String, dynamic> json) =>
      SearchCollectionModel(
        id: json["_id"],
        blockSpanKey: json["blockSpanKey"],
        chainType: json["chainType"],
        coverImage: json["coverImage"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "blockSpanKey": blockSpanKey,
        "chainType": chainType,
        "coverImage": coverImage,
        "name": name,
      };
}
