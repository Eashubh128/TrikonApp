import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trikon_app/providers/collectionsProvider.dart';

class NFTDetailsPage extends StatefulWidget {
  const NFTDetailsPage(
      {super.key,
      required this.chain,
      required this.contractAddress,
      required this.tokenId});

  final String chain;
  final String contractAddress;
  final String tokenId;
  @override
  State<NFTDetailsPage> createState() => _NFTDetailsPageState();
}

class _NFTDetailsPageState extends State<NFTDetailsPage>
    with SingleTickerProviderStateMixin {
  bool readMoreExpanded = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    Provider.of<CollectionsProvider>(context, listen: false).getNftDetails(
      chain: widget.chain,
      contractAddress: widget.contractAddress,
      tokenId: widget.tokenId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: 39.w,
            height: 39.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: const Center(
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Consumer<CollectionsProvider>(
        builder: (context, collectionProvider, child) {
          if (collectionProvider.nftDetail() == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0XFFBEF56E),
              ),
            );
          } else {
            return Stack(
              children: <Widget>[
                SizedBox(
                  width: 360.w,
                  height: double.maxFinite,
                  child: Image.network(
                    collectionProvider.nftDetail()!.nftImage == ""
                        ? collectionProvider.nftDetail()!.ipfsImage!
                        : collectionProvider.nftDetail()!.nftImage!,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) => const Center(
                        child: CircularProgressIndicator(
                      color: Color(0XFFBEF56E),
                    )),
                  ),
                ),
                DraggableScrollableSheet(
                  initialChildSize: .2,
                  minChildSize: .2,
                  maxChildSize: .7,
                  snap: false,
                  expand: true,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        controller: scrollController,
                        padding: EdgeInsets.zero,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 21.w, vertical: 30.h),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 20.h,
                                  width: 65.w,
                                  child: Divider(
                                    color: Colors.white,
                                    thickness: 5.w,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 22.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "#${collectionProvider.nftDetail()!.nftRarityRank}",
                                    style: TextStyle(
                                      color: const Color(0XFFBEF56E),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 100.w,
                                    // height: 23.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 5.h),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0XFFFFFFFF),
                                        width: .2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Trikon Rarity #${collectionProvider.nftDetail()!.nftRarityNumber}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "#${collectionProvider.nftDetail()!.nftName}",
                                    style: TextStyle(
                                      color: const Color(0XFFBDC1C680),
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Icon(
                                    Icons.verified,
                                    size: 15.w,
                                    color: const Color(0XFFBEF56E),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Owned by ",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "akaesofu",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0XFFBEF56E),
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/blur.png"),
                                  Text(
                                    "Listed On Blur",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "9.9 ETH",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  SizedBox(
                                    width: 20.h,
                                    height: 20.w,
                                    child: Image.asset(
                                      "assets/etherum2.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 11.w,
                                  ),
                                  Text(
                                    "\$18.352.13",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(.6),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 27.h,
                              ),
                              Text(
                                "DESCRIPTION",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              SizedBox(
                                child: Text(
                                  "The MUTANT APE YACHT CLUB is a collection of up to 20,000 Mutant Apes that can only be... Read More",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0XFFBDC1C680)
                                        .withOpacity(.5),
                                  ),
                                ),
                              ),
                              TabBar(
                                controller: _tabController,
                                indicatorColor: Colors.white,
                                indicatorSize: TabBarIndicatorSize.label,
                                tabs: [
                                  Tab(
                                    child: Text(
                                      "INFO",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "ATTRIBUTE",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "ITEM ACTIVITY",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 220.h,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    getInfoItem(collectionProvider),
                                    getAttributeItem(collectionProvider),
                                    Container(),
                                  ],
                                ),
                              ),
                              Container(
                                width: 271.w,
                                height: 40.h,
                                margin:
                                    EdgeInsets.only(left: 20.w, right: 20.w),
                                decoration: BoxDecoration(
                                    color: const Color(0XFFBEF56E),
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(-2, -2),
                                        color: Color(0XFF52820D),
                                        spreadRadius: 1.4,
                                        blurRadius: 10,
                                      ),
                                      BoxShadow(
                                        offset: Offset(2, 2),
                                        color: Color(0XFFFBFFF5),
                                        spreadRadius: 1.4,
                                        blurRadius: 5,
                                      )
                                    ]),
                                child: Center(
                                    child: Text(
                                  "Connect wallet to buy",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                              )
                            ],
                          ),
                        ));
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }

  getInfoItem(CollectionsProvider collectionProvider) {
    return Container(
      padding: EdgeInsets.only(top: 18.h, left: 21.w, right: 59.5.w),
      child: Column(
        children: [
          Row(children: [
            Text(
              "Created by",
              style: TextStyle(
                  fontSize: 10.5.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const Spacer(),
            Text(
              "MutantApeYachtClub",
              style: TextStyle(
                  fontSize: 10.5.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0XFFBEF56E)),
            )
          ]),
          SizedBox(
            height: 11.h,
          ),
          Row(children: [
            Text(
              "Contact Address",
              style: TextStyle(
                  fontSize: 10.5.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const Spacer(),
            Text(
              "${collectionProvider.nftDetail()!.nftContractAddress?.substring(0, 5)}",
              style: TextStyle(
                  fontSize: 10.5.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0XFFBEF56E)),
            )
          ]),
          SizedBox(
            height: 11.h,
          ),
          Row(children: [
            Text(
              "Token ID",
              style: TextStyle(
                  fontSize: 10.5.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const Spacer(),
            Text(
              "${collectionProvider.nftDetail()!.id}",
              style: TextStyle(
                  fontSize: 10.5.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0XFFBEF56E)),
            )
          ]),
          SizedBox(
            height: 11.h,
          ),
          Row(children: [
            Text(
              "Token Standard",
              style: TextStyle(
                  fontSize: 10.5.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const Spacer(),
            Text(
              "ERC-721",
              style: TextStyle(
                  fontSize: 10.5.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0XFFBEF56E)),
            )
          ]),
          SizedBox(
            height: 11.h,
          ),
          Row(children: [
            Text(
              "Blockchain",
              style: TextStyle(
                  fontSize: 10.5.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const Spacer(),
            Text(
              "ETHEREUM",
              style: TextStyle(
                  fontSize: 10.5.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0XFFBEF56E)),
            )
          ]),
          SizedBox(
            height: 11.h,
          ),
        ],
      ),
    );
  }

  getAttributeItem(CollectionsProvider collectionProvider) {
    return Container(
      height: 300.h,
      margin: EdgeInsets.symmetric(vertical: 17.h),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white.withOpacity(.4),
            Colors.white.withOpacity(.04),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.white,
            width: .2,
          )),
      child: Column(
          children: List.generate(
              collectionProvider.nftDetail()!.attributes!.length ?? 0, (index) {
        return Container(
          height: 42.h,
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.white, width: .2.h))),
          padding: EdgeInsets.only(
            top: 7.h,
            bottom: 6.61.h,
            left: 13.w,
            right: 13.w,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${collectionProvider.nftDetail()!.attributes!.elementAt(index).traitType}",
                    style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0XFFBEF56E)),
                  ),
                  SizedBox(
                    height: 1.31.h,
                  ),
                  Text(
                    "${collectionProvider.nftDetail()!.attributes!.elementAt(index).value}",
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "",
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                "6%",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        );
      })),
    );
  }
}
