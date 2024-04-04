import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trikon_app/models/getallgamingcollection/getallgamingcollection.dart';
import 'package:trikon_app/models/getalltopcollection/getalltopcollection.dart';
import 'package:trikon_app/models/getcollectionbykeychain/getcollectionbykeychain.dart';
import 'package:trikon_app/models/getnftbyaddresschain/getnftbyaddresschain.dart';
import 'package:trikon_app/models/getsinglenft/getsinglenft.dart';
import 'package:trikon_app/models/searchcollection/searchcollection.dart';

class ApiCalls {
  static getAllTopCollections() async {
    var headers = {'Content-Type': 'application/json'};
    var requestBody =
        json.encode({"chain": "eth-main", "ranking": "one_day_volume"});

    try {
      var response = await http.post(
        Uri.parse(
            'https://marketplacebackend.trikon.io/api/getAllTopCollections'),
        body: requestBody,
        headers: headers,
      );
      print(response.body);
      if (response.statusCode == 200) {
        AllTopCollections allTopCollections =
            getAllTopCollectionsFromJson(response.body);

        return allTopCollections;
      } else {
        throw "Cannot get top collections";
      }
    } catch (e) {
      throw "Error ocurred in getting top collections $e";
    }
  }

  static getAllGamingCollections() async {
    var headers = {'Content-Type': 'application/json'};
    var requestBody = json.encode({"pageSize": 3, "pageNumber": 4});

    try {
      var response = await http.post(
        Uri.parse(
            'https://marketplacebackend.trikon.io/api/getGamingCollections'),
        body: requestBody,
        headers: headers,
      );
      print(response.body);
      if (response.statusCode == 200) {
        List<AllGamingCollectionModel> allGamingCollection =
            getAllGamingCollectionModelFromJson(response.body);

        return allGamingCollection;
      } else {
        throw "Cannot get gaming collection";
      }
    } catch (e) {
      throw "Error ocurred in getting gaming collections $e";
    }
  }

  static getCollectionByKeyNChain(
      {required String key, required String chain}) async {
    var headers = {'Content-Type': 'application/json'};
    var requestBody = json.encode({"chain": chain, "key": key});

    try {
      var response = await http.post(
        Uri.parse(
            'https://marketplacebackend.trikon.io/api/getCollectionByKey'),
        body: requestBody,
        headers: headers,
      );
      print(response.body);
      if (response.statusCode == 200) {
        CollectionDetails collectionDetails =
            getCollectionByKeyChainFromJson(response.body);

        return collectionDetails;
      } else {
        throw "Cannot get collection details";
      }
    } catch (e) {
      throw "Error ocurred in getting collection details $e";
    }
  }

  static getNftsOfCollection(
      {required String contractAddress, required String chain}) async {
    var headers = {'Content-Type': 'application/json'};
    var requestBody =
        json.encode({"contract_address": contractAddress, "chain": chain});

    try {
      var response = await http.post(
        Uri.parse(
            'https://marketplacebackend.trikon.io/api/getNFTsofCollection'),
        body: requestBody,
        headers: headers,
      );
      print(response.body);
      if (response.statusCode == 200) {
        NftByAddressChain nftCollection =
            getNftByAddressChainFromJson(response.body);

        return nftCollection;
      } else {
        throw "Cannot get nft of collection details";
      }
    } catch (e) {
      throw "Error ocurred in getting nft of collection $e";
    }
  }

  static getSingleNftDetails(
      {required String address,
      required String chain,
      required String tokenid}) async {
    var headers = {'Content-Type': 'application/json'};
    var requestBody = json.encode({
      "contract_address": address,
      "token_id": tokenid, //Hardcode
      "chain": chain
    });

    try {
      var response = await http.post(
        Uri.parse('https://marketplacebackend.trikon.io/api/getSingleNFT'),
        body: requestBody,
        headers: headers,
      );
      print(response.body);
      if (response.statusCode == 200) {
        SingleNftModel nftCollection = getSingleNftModelFromJson(response.body);

        return nftCollection;
      } else {
        throw "Cannot get nft of collection details";
      }
    } catch (e) {
      throw "Error ocurred in getting nft of collection $e";
    }
  }

  static getSearchedCollection({
    required String text,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var requestBody = json.encode({"searchValue": text});

    try {
      var response = await http.post(
        Uri.parse('https://marketplacebackend.trikon.io/api/searchCollection'),
        body: requestBody,
        headers: headers,
      );
      print(response.body);
      if (response.statusCode == 200) {
        List<SearchCollectionModel> searchedCollection =
            searchCollectionModelFromJson(response.body);

        return searchedCollection;
      } else {
        throw "Cannot get nft of collection details";
      }
    } catch (e) {
      throw "Error ocurred in getting nft of collection $e";
    }
  }
}
