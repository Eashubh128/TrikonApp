import 'dart:convert';

List<AllGamingCollectionModel> getAllGamingCollectionModelFromJson(
        String str) =>
    List<AllGamingCollectionModel>.from(
        json.decode(str).map((x) => AllGamingCollectionModel.fromJson(x)));

class AllGamingCollectionModel {
  String? id;
  String? name;
  String? blockSpanKey;
  String? chainType;
  String? coverImage;
  String? floorPrice;
  String? averagePrice;
  String? totalVolume;
  double? averagePriceInDollar;

  AllGamingCollectionModel({
    this.id,
    this.name,
    this.blockSpanKey,
    this.chainType,
    this.coverImage,
    this.floorPrice,
    this.averagePrice,
    this.totalVolume,
    this.averagePriceInDollar,
  });

  factory AllGamingCollectionModel.fromJson(Map<String, dynamic> json) =>
      AllGamingCollectionModel(
        id: json["_id"] == "null" ? "313e334vc3ct43" : json["_id"],
        name: json["name"] == "null" ? "dortor" : json["name"],
        blockSpanKey: json["blockSpanKey"] == "null"
            ? "adfadsfaeawfawf"
            : json["blockSpanKey"],
        chainType: json["chainType"] == "null" ? "eth-main" : json["chainType"],
        coverImage: json["coverImage"] == "null" ? "" : json["coverImage"],
        floorPrice: json["floorPrice"] == "" ? "3.3" : json["floorPrice"],
        averagePrice:
            json["averagePrice"] == "null" ? "2.99" : json["averagePrice"],
        totalVolume:
            json["totalVolume"] == "null" ? "2223" : json["totalVolume"],
        averagePriceInDollar: json["averagePriceInDollar"]?.toDouble() ?? 0.0,
      );
}
