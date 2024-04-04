// To parse this JSON data, do
//
//     final getNftByAddressChain = getNftByAddressChainFromJson(jsonString);

import 'dart:convert';

NftByAddressChain getNftByAddressChainFromJson(String str) =>
    NftByAddressChain.fromJson(json.decode(str));

class NftByAddressChain {
  String? id;
  String? contractAddress;
  String? key;
  String? chain;
  DateTime? lastUpdated;
  List<NftCollectionList>? nftCollectionList;
  int? v;

  NftByAddressChain({
    this.id,
    this.contractAddress,
    this.key,
    this.chain,
    this.lastUpdated,
    this.nftCollectionList,
    this.v,
  });
  factory NftByAddressChain.fromJson(Map<String, dynamic> json) =>
      NftByAddressChain(
        id: json["_id"] == "null" ? 'errewq43rq3242c34' : json["_id"],
        contractAddress: json["contractAddress"] == "null"
            ? 'd423r23r2d3r2d34r2'
            : json["contractAddress"],
        key: json["key"] == "null" ? 'd2rd234r' : json["key"],
        chain: json["chain"] == "null" ? 'eth_main' : json["chain"],
        lastUpdated: json["lastUpdated"] == null
            ? DateTime.now()
            : DateTime.parse(json["lastUpdated"]),
        nftCollectionList: json["nftCollectionList"] == null
            ? []
            : List<NftCollectionList>.from(json["nftCollectionList"]!
                .map((x) => NftCollectionList.fromJson(x))),
        v: json["__v"],
      );
}

class NftCollectionList {
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

  NftCollectionList({
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

  factory NftCollectionList.fromJson(Map<String, dynamic> json) =>
      NftCollectionList(
        nftName: json["nftName"] == "null" ? 'bingae' : json["nftName"],
        nftContractAddress: json["nftContractAddress"] == "null"
            ? 'asqf4fc4q34r4q3'
            : json["nftContractAddress"],
        nftTokenId:
            json["nftTokenId"] == "null" ? '324342' : json["nftTokenId"],
        nftRarityNumber: json["nftRarityNumber"] == "null"
            ? '3234'
            : json["nftRarityNumber"],
        nftRarityRank:
            json["nftRarityRank"] == "null" ? '365' : json["nftRarityRank"],
        nftPrice: json["nftPrice"] == "null" ? '22' : json["nftPrice"],
        nftPriceInUsd:
            json["nftPriceInUSD"] == "null" ? '344324' : json["nftPriceInUSD"],
        nftLastSale: json["nftLastSale"] == "null" ? '34' : json["nftLastSale"],
        owners: json["owners"] == "null" ? '3242' : json["owners"],
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
            json["createdDate"] == "null" ? '99 days ago' : json["createdDate"],
        lastUpdated: json["lastUpdated"] == null
            ? DateTime.now()
            : DateTime.parse(json["lastUpdated"]),
        id: json["_id"] == "null" ? '32c3r2c32cr2rcq' : json["_id"],
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
}
