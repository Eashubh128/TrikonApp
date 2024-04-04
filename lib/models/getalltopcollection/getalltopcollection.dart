import 'dart:convert';

AllTopCollections getAllTopCollectionsFromJson(String str) =>
    AllTopCollections.fromJson(json.decode(str));

class AllTopCollections {
  String? id;
  String? rankDeterminingType;
  List<TopCollectionsList>? topCollectionsList;
  int? v;

  AllTopCollections({
    this.id,
    this.rankDeterminingType,
    this.topCollectionsList,
    this.v,
  });

  factory AllTopCollections.fromJson(Map<String, dynamic> json) =>
      AllTopCollections(
        id: json["_id"] == "null" ? "313e334vc3ct43" : json["_id"],
        rankDeterminingType: json["rank_determiningType"] == "null"
            ? "default_rankDeterminingType"
            : json["rank_determiningType"],
        topCollectionsList: json["topCollectionsList"] == null
            ? []
            : List<TopCollectionsList>.from(json["topCollectionsList"]!
                .map((x) => TopCollectionsList.fromJson(x))),
        v: json["__v"],
      );
}

class TopCollectionsList {
  int? rank;
  String? blockSpanKey;
  String? name;
  List<String>? contracts;
  String? chainType;
  String? coverImage;
  String? floorPriceInEth;
  String? topBidInEth;
  String? noOfOwners;
  String? oneDayVolumeEth;
  String? oneDayVolumeChangePercent;
  String? sevenDayVolumeEth;
  String? sevenDayVolumeChangePercent;
  String? supply;
  String? totalSales;
  String? averagePrice;
  String? id;

  TopCollectionsList({
    this.rank,
    this.blockSpanKey,
    this.name,
    this.contracts,
    this.chainType,
    this.coverImage,
    this.floorPriceInEth,
    this.topBidInEth,
    this.noOfOwners,
    this.oneDayVolumeEth,
    this.oneDayVolumeChangePercent,
    this.sevenDayVolumeEth,
    this.sevenDayVolumeChangePercent,
    this.supply,
    this.totalSales,
    this.averagePrice,
    this.id,
  });

  factory TopCollectionsList.fromJson(Map<String, dynamic> json) =>
      TopCollectionsList(
        rank: json["rank"],
        blockSpanKey: json["blockSpanKey"] == "null"
            ? "asdfdasfdasf"
            : json["blockSpanKey"],
        name: json["name"] == "null" ? "default_name" : json["name"],
        contracts: json["contracts"] == null
            ? []
            : List<String>.from(json["contracts"]!.map((x) => x)),
        chainType: json["chainType"] == "null" ? "eth_main" : json["chainType"],
        coverImage: json["coverImage"] == "null" ? "" : json["coverImage"],
        floorPriceInEth: json["floorPriceInEth"] == "null"
            ? "3.32"
            : json["floorPriceInEth"],
        topBidInEth:
            json["topBidInEth"] == "null" ? "3.8" : json["topBidInEth"],
        noOfOwners: json["noOfOwners"] == "null" ? "92" : json["noOfOwners"],
        oneDayVolumeEth:
            json["oneDayVolumeEth"] == "null" ? ".34" : json["oneDayVolumeEth"],
        oneDayVolumeChangePercent: json["oneDayVolumeChangePercent"] == "null"
            ? "2.4"
            : json["oneDayVolumeChangePercent"],
        sevenDayVolumeEth: json["sevenDayVolumeEth"] == "null"
            ? "2.22"
            : json["sevenDayVolumeEth"],
        sevenDayVolumeChangePercent:
            json["sevenDayVolumeChangePercent"] == "null"
                ? "14.8"
                : json["sevenDayVolumeChangePercent"],
        supply: json["supply"] == "null" ? "23223" : json["supply"],
        totalSales: json["totalSales"] == "null" ? "4432" : json["totalSales"],
        averagePrice:
            json["averagePrice"] == "null" ? "42" : json["averagePrice"],
        id: json["_id"] == "null" ? "313e334vc3ct43" : json["_id"],
      );
}
