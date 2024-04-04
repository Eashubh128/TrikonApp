import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:trikon_app/apis/apicalls.dart';
import 'package:trikon_app/models/getallgamingcollection/getallgamingcollection.dart';
import 'package:trikon_app/models/getcollectionbykeychain/getcollectionbykeychain.dart';
import 'package:trikon_app/models/getnftbyaddresschain/getnftbyaddresschain.dart';
import 'package:trikon_app/models/getsinglenft/getsinglenft.dart';
import 'package:trikon_app/models/searchcollection/searchcollection.dart';

import '../models/getalltopcollection/getalltopcollection.dart';

class CollectionsProvider extends ChangeNotifier {
  AllTopCollections? _allTopCollections;
  List<AllGamingCollectionModel> _gamingCollectionModel = [];
  List<SearchCollectionModel> _seachedCollectionResult = [];
  CollectionDetails? _collectionDetails;
  NftByAddressChain? _nftOfCollections;
  SingleNftModel? _nftDetails;

  void getAllTopCollections() async {
    try {
      _allTopCollections = await ApiCalls.getAllTopCollections();
      _gamingCollectionModel = await ApiCalls.getAllGamingCollections();
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  void getCollectionByKeyNChain(
      {required String key, required String chain}) async {
    try {
      _collectionDetails =
          await ApiCalls.getCollectionByKeyNChain(key: key, chain: chain);

      notifyListeners();
    } catch (e) {}
  }

  void getNFTsofCollection(
      {required String chain, required String contractAddress}) async {
    try {
      _nftOfCollections = await ApiCalls.getNftsOfCollection(
          contractAddress: contractAddress, chain: chain);

      notifyListeners();
    } catch (e) {}
  }

  void getNftDetails(
      {required String chain,
      required String contractAddress,
      required String tokenId}) async {
    try {
      _nftDetails = await ApiCalls.getSingleNftDetails(
          tokenid: tokenId, address: contractAddress, chain: chain);
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  void searchForCollection({required String searchText}) async {
    try {
      _seachedCollectionResult =
          await ApiCalls.getSearchedCollection(text: searchText);
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  CollectionDetails? collectionDetails() => _collectionDetails;

  SingleNftModel? nftDetail() => _nftDetails;

  List<AllGamingCollectionModel> allGamingCollection() =>
      _gamingCollectionModel;

  NftByAddressChain? allNFTOfCollection() => _nftOfCollections;

  AllTopCollections? topCollection() => _allTopCollections;
  List<SearchCollectionModel> searchedCollection() => _seachedCollectionResult;
}
