import 'dart:convert';

SingleNftModel getSingleNftModelFromJson(String str) =>
    SingleNftModel.fromJson(json.decode(str));

class SingleNftModel {
  String? nftName;
  String? nftContractAddress;
  String? nftTokenId;
  String? nftRarityNumber;
  String? nftRarityRank;
  String? nftPrice;
  String? nftPriceInUsd;
  String? nftLastSale;
  String? owners;
  String? nftDescription;
  String? nftImage;
  List<Attribute>? attributes;
  String? uri;
  String? ipfsImage;
  String? tokenType;
  String? createdDate;
  DateTime? lastUpdated;
  String? id;

  SingleNftModel({
    this.nftName,
    this.nftContractAddress,
    this.nftTokenId,
    this.nftRarityNumber,
    this.nftRarityRank,
    this.nftPrice,
    this.nftPriceInUsd,
    this.nftLastSale,
    this.owners,
    this.nftDescription,
    this.nftImage,
    this.attributes,
    this.uri,
    this.ipfsImage,
    this.tokenType,
    this.createdDate,
    this.lastUpdated,
    this.id,
  });

  factory SingleNftModel.fromJson(Map<String, dynamic> json) => SingleNftModel(
        nftName: json["nftName"] == "null" ? 'cleanoe' : json["nftName"],
        nftContractAddress: json["nftContractAddress"] == "null"
            ? '3r32ded32dr23d'
            : json["nftContractAddress"],
        nftTokenId: json["nftTokenId"] == "null" ? '2324' : json["nftTokenId"],
        nftRarityNumber: json["nftRarityNumber"] == "null"
            ? '5454'
            : json["nftRarityNumber"],
        nftRarityRank:
            json["nftRarityRank"] == "null" ? '34' : json["nftRarityRank"],
        nftPrice: json["nftPrice"] == "null" ? '66' : json["nftPrice"],
        nftPriceInUsd:
            json["nftPriceInUSD"] == "null" ? '3242424' : json["nftPriceInUSD"],
        nftLastSale: json["nftLastSale"] == "null" ? '23' : json["nftLastSale"],
        owners: json["owners"] == "null" ? '3' : json["owners"],
        nftDescription: json["nftDescription"] == "null"
            ? 'default_nftDescription'
            : json["nftDescription"],
        nftImage: json["nftImage"] == "null" ? '' : json["nftImage"],
        attributes: json["attributes"] == null
            ? []
            : List<Attribute>.from(
                json["attributes"]!.map((x) => Attribute.fromJson(x))),
        uri: json["uri"] == "null" ? 'default_uri' : json["uri"],
        ipfsImage: json["ipfsImage"] == "null" ? '' : json["ipfsImage"],
        tokenType: json["tokenType"] == "null" ? 'ERC-721' : json["tokenType"],
        createdDate:
            json["createdDate"] == "null" ? '120days ago' : json["createdDate"],
        lastUpdated: json["lastUpdated"] == null
            ? DateTime.now()
            : DateTime.parse(json["lastUpdated"]),
        id: json["_id"] == "null" ? '3exdex3r3r2x32' : json["_id"],
      );
}

class Attribute {
  String? value;
  String? traitType;
  String? id;

  Attribute({
    this.value,
    this.traitType,
    this.id,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        value: json["value"],
        traitType: json["trait_type"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "trait_type": traitType,
        "_id": id,
      };
}
