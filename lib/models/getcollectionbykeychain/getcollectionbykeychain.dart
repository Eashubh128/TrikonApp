// To parse this JSON data, do
//
//     final getCollectionByKeyChain = getCollectionByKeyChainFromJson(jsonString);

import 'dart:convert';

CollectionDetails getCollectionByKeyChainFromJson(String str) =>
    CollectionDetails.fromJson(json.decode(str));

class CollectionDetails {
  String? id;
  String? blockSpanKey;
  String? updatedDate;
  List<String>? contracts;
  String? chainType;
  String? coverImage;
  String? bannerImage;
  String? totalNfTs;
  String? createdByAddress;
  String? createdDate;
  String? creatorFee;
  String? description;
  List<SocialLink>? socialLinks;
  String? floorPrice;
  String? marketCap;
  String? oneDayVolume;
  String? oneDayVolumeChangePercent;
  String? sevenDayVolume;
  String? sevenDayVolumeChangePercent;
  String? thirtyDayVolume;
  String? thirtyDayVolumeChangePercent;
  String? numOfOwners;
  String? supply;
  String? royalty;
  int? v;
  String? category;
  String? name;
  String? averagePrice;
  String? totalSales;
  String? totalVolume;

  CollectionDetails({
    this.id,
    this.blockSpanKey,
    this.updatedDate,
    this.contracts,
    this.chainType,
    this.coverImage,
    this.bannerImage,
    this.totalNfTs,
    this.createdByAddress,
    this.createdDate,
    this.creatorFee,
    this.description,
    this.socialLinks,
    this.floorPrice,
    this.marketCap,
    this.oneDayVolume,
    this.oneDayVolumeChangePercent,
    this.sevenDayVolume,
    this.sevenDayVolumeChangePercent,
    this.thirtyDayVolume,
    this.thirtyDayVolumeChangePercent,
    this.numOfOwners,
    this.supply,
    this.royalty,
    this.v,
    this.category,
    this.name,
    this.averagePrice,
    this.totalSales,
    this.totalVolume,
  });

  factory CollectionDetails.fromJson(Map<String, dynamic> json) =>
      CollectionDetails(
        id: json["_id"] == "null" ? "2343c2c13rqr3r32" : json["_id"],
        blockSpanKey: json["blockSpanKey"] == "null"
            ? "c3rd3qrf3qrv4q3"
            : json["blockSpanKey"],
        updatedDate:
            json["updatedDate"] == "null" ? "4days ago" : json["updatedDate"],
        contracts: json["contracts"] == null
            ? []
            : List<String>.from(json["contracts"]!.map((x) => x)),
        chainType: json["chainType"] == "null" ? "eth_main" : json["chainType"],
        coverImage: json["coverImage"] == "null" ? "" : json["coverImage"],
        bannerImage: json["bannerImage"] == "null" ? "" : json["bannerImage"],
        totalNfTs: json["totalNFTs"] == "null" ? "23" : json["totalNFTs"],
        createdByAddress: json["createdByAddress"] == "null"
            ? "234233432322342"
            : json["createdByAddress"],
        createdDate:
            json["createdDate"] == "null" ? "23days ago" : json["createdDate"],
        creatorFee: json["creatorFee"] == "null" ? ".9" : json["creatorFee"],
        description: json["description"] == "null"
            ? "default_description"
            : json["description"],
        socialLinks: json["socialLinks"] == null
            ? []
            : List<SocialLink>.from(
                json["socialLinks"]!.map((x) => SocialLink.fromJson(x))),
        floorPrice: json["floorPrice"] == "null" ? "32.3" : json["floorPrice"],
        marketCap: json["market_cap"] == "null" ? "18" : json["market_cap"],
        oneDayVolume:
            json["one_day_volume"] == "null" ? ".4" : json["one_day_volume"],
        oneDayVolumeChangePercent:
            json["one_day_volume_change_percent"] == "null"
                ? ".55"
                : json["one_day_volume_change_percent"],
        sevenDayVolume: json["seven_day_volume"] == "null"
            ? "2.8"
            : json["seven_day_volume"],
        sevenDayVolumeChangePercent:
            json["seven_day_volume_change_percent"] == "null"
                ? "38.5"
                : json["seven_day_volume_change_percent"],
        thirtyDayVolume: json["thirty_day_volume"] == "null"
            ? "434"
            : json["thirty_day_volume"],
        thirtyDayVolumeChangePercent:
            json["thirty_day_volume_change_percent"] == "null"
                ? "73"
                : json["thirty_day_volume_change_percent"],
        numOfOwners:
            json["numOfOwners"] == "null" ? "234" : json["numOfOwners"],
        supply: json["supply"] == "null" ? "6573" : json["supply"],
        royalty: json["royalty"] == "null" ? ".4" : json["royalty"],
        v: json["__v"],
        category:
            json["category"] == "null" ? "default_category" : json["category"],
        name: json["name"] == "null" ? "rortos" : json["name"],
        averagePrice:
            json["averagePrice"] == "null" ? "33" : json["averagePrice"],
        totalSales: json["totalSales"] == "null" ? "233" : json["totalSales"],
        totalVolume:
            json["totalVolume"] == "null" ? "34212" : json["totalVolume"],
      );
}

class SocialLink {
  String? name;
  String? link;
  String? id;

  SocialLink({
    this.name,
    this.link,
    this.id,
  });

  SocialLink copyWith({
    String? name,
    String? link,
    String? id,
  }) =>
      SocialLink(
        name: name ?? this.name,
        link: link ?? this.link,
        id: id ?? this.id,
      );

  factory SocialLink.fromJson(Map<String, dynamic> json) => SocialLink(
        name: json["name"] == "null" ? "quinte" : json["name"],
        link: json["link"] == "null" ? "ewinte" : json["link"],
        id: json["_id"] == "null" ? "dsfsdfs2" : json["_id"],
      );
}
