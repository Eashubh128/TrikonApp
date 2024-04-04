import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:trikon_app/providers/collectionsProvider.dart';
import 'package:trikon_app/screens/nft_details_screen.dart';

class CollectionDetailScreen extends StatefulWidget {
  const CollectionDetailScreen({
    super.key,
    required this.spanKey,
    required this.chain,
    required this.contractAddress,
  });

  final String spanKey;
  final String chain;
  final String contractAddress;
  @override
  State<CollectionDetailScreen> createState() => _CollectionDetailScreenState();
}

class _CollectionDetailScreenState extends State<CollectionDetailScreen> {
  bool readMoreExpanded = false;
  bool isItems = true;
  bool isActivity = false;
  bool isPro = false;
  final _controller = ValueNotifier<bool>(false);

  void _toggleSwitch(bool value) {
    setState(() {
      isPro = value;
    });
  }

  @override
  void initState() {
    super.initState();
    Provider.of<CollectionsProvider>(context, listen: false)
        .getCollectionByKeyNChain(key: widget.spanKey, chain: widget.chain);

    print("${widget.chain} + ${widget.spanKey}  +  ${widget.contractAddress}");

    Provider.of<CollectionsProvider>(context, listen: false)
        .getNFTsofCollection(
            chain: widget.chain, contractAddress: widget.contractAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      extendBody: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: 41.w,
            height: 41.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1.w,
                color: const Color(0XFFE8ECF4),
              ),
            ),
            child: const Center(
                child: Icon(
              Icons.keyboard_arrow_left,
              color: Color(0XFFBEF56E),
              size: 35,
            )),
          ),
        ),
        actions: [
          ValueListenableBuilder(
              valueListenable: _controller,
              builder: (context, value, child) {
                if (value) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 42.5.w,
                      height: 42.5.h,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.share,
                        size: 26,
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 42.5.w,
              height: 42.5.h,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.favorite_outline,
                size: 26,
              ),
            ),
          )
        ],
      ),
      body: Consumer<CollectionsProvider>(
          builder: (context, collectionProvider, child) {
        if (collectionProvider.collectionDetails() == null) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(
                0XFFBEF56E,
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 227.h,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Image.network(
                          collectionProvider.collectionDetails()!.bannerImage!,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox();
                          },
                          width: double.maxFinite,
                          height: 227.h,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 16.w,
                        child: Container(
                          width: 109.w,
                          height: 109.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(
                                0XFFBEF56E,
                              ),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(109.w),
                            child: Image.network(collectionProvider
                                .collectionDetails()!
                                .coverImage!),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 16.w,
                        bottom: 0,
                        child: SizedBox(
                            child: Row(
                          children: [
                            Image.asset(
                              "assets/ethscan.png",
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Image.asset(
                              "assets/www.png",
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Image.asset(
                              "assets/discord.png",
                            )
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 9.83.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 250.w,
                            child: Text(
                              collectionProvider.collectionDetails()!.name!,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.verified,
                            color: Color(
                              0XFFBEF56E,
                            ),
                            size: 24,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 100.w,
                            child: Text(
                              "By ${collectionProvider.collectionDetails()!.createdByAddress!}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: const Color(0XFF898A8D),
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.verified,
                            color: Color(
                              0XFFBEF56E,
                            ),
                            size: 24,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        child: RichText(
                          text: TextSpan(
                            text: "Items ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    "${collectionProvider.collectionDetails()!.totalNfTs} | ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ),
                              TextSpan(
                                  text: "Created ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          "${collectionProvider.collectionDetails()!.createdDate} | ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    )
                                  ]),
                              TextSpan(
                                  text: "Creator fee ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          "${collectionProvider.collectionDetails()!.creatorFee} | ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    )
                                  ]),
                              TextSpan(
                                  text: "Chain ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          "${collectionProvider.collectionDetails()!.chainType} ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    )
                                  ]),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      Text(
                        "DESCRIPTION",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          "${collectionProvider.collectionDetails()!.description!.substring(0, readMoreExpanded ? collectionProvider.collectionDetails()!.description!.length : 80)} ${readMoreExpanded ? "." : "..."}",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          readMoreExpanded = !readMoreExpanded;
                          setState(() {});
                        },
                        child: Text(
                          readMoreExpanded ? "Read less" : "Read More",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            color: const Color(
                              0XFFBEF56E,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 33.h),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              isItems = true;
                              isActivity = false;
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3.h, horizontal: 10.w),
                              height: 30.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: isItems
                                    ? const Color(
                                        0XFF141414,
                                      )
                                    : Colors.black,
                              ),
                              child: Center(
                                child: Text(
                                  "Items",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: isItems
                                        ? const Color(0XFFBEF56E)
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 32.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              isActivity = true;
                              isItems = false;
                              setState(() {});
                            },
                            child: Container(
                              height: 30.h,
                              padding: EdgeInsets.symmetric(
                                  vertical: 3.h, horizontal: 10.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: isActivity
                                    ? const Color(
                                        0XFF141414,
                                      )
                                    : Colors.black,
                              ),
                              child: Center(
                                child: Text(
                                  "Activity",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: isActivity
                                        ? const Color(0XFFBEF56E)
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          AdvancedSwitch(
                            controller: _controller,
                            activeColor: const Color(0XFFBEF56E),
                            inactiveColor: const Color(0XFFFFFFFF),
                            thumb: Container(
                              width: 16.38.w,
                              height: 16.38.h,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                            activeChild: Text(
                              'Pro',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            inactiveChild: Text('Pro',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w600,
                                )),
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(15)),
                            width: 41.w,
                            height: 20.h,
                            enabled: true,
                            disabledOpacity: 0.5,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      ValueListenableBuilder(
                          valueListenable: _controller,
                          builder: (context, value, widget) {
                            return _controller.value
                                ? getProContainer(collectionProvider)
                                : getBasicContainer(collectionProvider);
                          }),
                      SizedBox(height: 15.h),
                      SizedBox(
                        height: 44.h,
                        width: 400.w,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                  textInputAction: TextInputAction.go,
                                  textAlign: TextAlign.left,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Color(0XFFBDC1C680),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Color(0XFFBDC1C680),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Color(0XFFBDC1C680),
                                      ),
                                    ),
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onEditingComplete: () {}),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.filter_list,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 26.33.h,
                      ),
                      ValueListenableBuilder(
                          valueListenable: _controller,
                          builder: (context, value, widget) {
                            return _controller.value
                                ? SizedBox(
                                    child: Row(
                                      children: [
                                        Text(
                                          "ALL",
                                          style: TextStyle(
                                              color: const Color(0XFFBEF56E),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp),
                                        ),
                                        SizedBox(
                                          width: 10.22.w,
                                        ),
                                        Image.asset("assets/ethereum.png"),
                                        SizedBox(
                                          width: 10.22.w,
                                        ),
                                        Image.asset("assets/polygon-grey.png"),
                                        SizedBox(
                                          width: 10.22.w,
                                        ),
                                        Image.asset("assets/x.png"),
                                        SizedBox(
                                          width: 100.w,
                                        ),
                                        Container(
                                          width: 53.w,
                                          height: 26.h,
                                          decoration: BoxDecoration(
                                            color: const Color(
                                              0XFFBEF56E,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "ETH",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Container(
                                          width: 53.w,
                                          height: 26.h,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            border: Border.all(
                                              width: .3,
                                              color: Color(0XFFBDC1C6),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "USD",
                                              style: TextStyle(
                                                color: Color(0XFFBDC1C6),
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink();
                          }),
                      collectionProvider.allNFTOfCollection() != null
                          ? ValueListenableBuilder(
                              valueListenable: _controller,
                              builder: (context, value, child) {
                                return GridView.count(
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 20.h),
                                  childAspectRatio: value == true ? (.47) : .6,
                                  scrollDirection: Axis.vertical,
                                  mainAxisSpacing: 28.h,
                                  crossAxisSpacing: 30.w,
                                  children: List.generate(
                                      collectionProvider
                                          .allNFTOfCollection()!
                                          .nftCollectionList!
                                          .length, (index) {
                                    return ValueListenableBuilder(
                                        valueListenable: _controller,
                                        builder: (context, value, child) {
                                          if (value) {
                                            return getProNftContainer(
                                                collectionProvider:
                                                    collectionProvider);
                                          } else {
                                            return getBasicNftContainer(
                                                collectionProvider:
                                                    collectionProvider);
                                          }
                                        });
                                  }),
                                );
                              },
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                                color: Color(0XFFBEF56E),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  getProContainer(CollectionsProvider collectionProvider) {
    return Container(
      width: double.maxFinite,
      // height: 330.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(
          0XFF141414,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FLOOR PRICE",
                    style: TextStyle(
                        fontSize: 13.9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFFC1C680).withOpacity(.5)),
                  ),
                  SizedBox(
                    width: 200.w,
                    child: Row(
                      children: [
                        Text(
                          "${collectionProvider.collectionDetails()!.floorPrice}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 17.3.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Image.asset("assets/etherum2.png")
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "24H VOLUME",
                    style: TextStyle(
                        fontSize: 13.9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFFC1C680).withOpacity(.5)),
                  ),
                  SizedBox(
                    width: 90.w,
                    child: Row(
                      children: [
                        Text(
                          collectionProvider
                              .collectionDetails()!
                              .oneDayVolume!
                              .substring(0, 4),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 17.3.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Image.asset("assets/etherum2.png")
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 31.3.h,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1D CHANGE",
                    style: TextStyle(
                        fontSize: 13.9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFFC1C680).withOpacity(.5)),
                  ),
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      "${collectionProvider.collectionDetails()!.oneDayVolumeChangePercent?.substring(0, 5)} %",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 17.3.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0XFFBEF56E)),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "7D VOLUME",
                    style: TextStyle(
                        fontSize: 13.9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFFC1C680).withOpacity(.5)),
                  ),
                  SizedBox(
                    width: 90.w,
                    child: Row(
                      children: [
                        Text(
                          collectionProvider
                              .collectionDetails()!
                              .sevenDayVolume!
                              .substring(0, 4),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 17.3.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Image.asset("assets/etherum2.png")
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 31.3.h,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "7D CHANGE",
                    style: TextStyle(
                        fontSize: 13.9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFFC1C680).withOpacity(.5)),
                  ),
                  SizedBox(
                    width: 90.w,
                    child: Row(
                      children: [
                        Text(
                          collectionProvider
                              .collectionDetails()!
                              .sevenDayVolumeChangePercent!
                              .substring(0, 4),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 17.3.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Image.asset("assets/etherum2.png")
                      ],
                    ),
                  )
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "30D VOLUME",
                    style: TextStyle(
                        fontSize: 13.9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFFC1C680).withOpacity(.5)),
                  ),
                  SizedBox(
                    width: 90.w,
                    child: Text(
                      collectionProvider
                              .collectionDetails()!
                              .thirtyDayVolumeChangePercent!
                              .substring(0, 4) +
                          "%",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 17.3.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0XFFBEF56E)),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 31.3.h,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "OWNERS",
                    style: TextStyle(
                        fontSize: 13.9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFFC1C680).withOpacity(.5)),
                  ),
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      "${collectionProvider.collectionDetails()!.numOfOwners}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17.3.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SUPPLY",
                    style: TextStyle(
                        fontSize: 13.9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFFC1C680).withOpacity(.5)),
                  ),
                  SizedBox(
                    width: 90.w,
                    child: Text(
                      collectionProvider.collectionDetails()!.supply.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 17.3.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 31.3.h,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ROYALTY",
                    style: TextStyle(
                        fontSize: 13.9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFFC1C680).withOpacity(.5)),
                  ),
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      "${collectionProvider.collectionDetails()!.royalty}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17.3.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  getBasicContainer(CollectionsProvider collectionProvider) {
    return Container(
      width: double.maxFinite,
      height: 220.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(
          0XFF141414,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FLOOR PRICE",
                    style: TextStyle(
                        fontSize: 13.9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFFC1C680).withOpacity(.5)),
                  ),
                  SizedBox(
                    width: 200.w,
                    child: Row(
                      children: [
                        Text(
                          "${collectionProvider.collectionDetails()!.floorPrice}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 17.3.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Image.asset("assets/etherum2.png")
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "24H VOLUME",
                    style: TextStyle(
                        fontSize: 13.9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFFC1C680).withOpacity(.5)),
                  ),
                  SizedBox(
                    width: 90.w,
                    child: Row(
                      children: [
                        Text(
                          collectionProvider
                              .collectionDetails()!
                              .oneDayVolume!
                              .substring(0, 4),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 17.3.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Image.asset("assets/etherum2.png")
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 31.3.h,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1D CHANGE",
                    style: TextStyle(
                        fontSize: 13.9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFFC1C680).withOpacity(.5)),
                  ),
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      "${collectionProvider.collectionDetails()!.oneDayVolumeChangePercent?.substring(0, 5)} %",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 17.3.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0XFFBEF56E)),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "OWNERS",
                    style: TextStyle(
                        fontSize: 13.9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFFC1C680).withOpacity(.5)),
                  ),
                  SizedBox(
                    width: 90.w,
                    child: Text(
                      collectionProvider
                          .collectionDetails()!
                          .numOfOwners
                          .toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 17.3.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 31.3.h,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SUPPLY",
                    style: TextStyle(
                        fontSize: 13.9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFFC1C680).withOpacity(.5)),
                  ),
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      "${collectionProvider.collectionDetails()!.supply}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17.3.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ROYALTY",
                    style: TextStyle(
                        fontSize: 13.9.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFFC1C680).withOpacity(.5)),
                  ),
                  SizedBox(
                    width: 90.w,
                    child: Text(
                      collectionProvider
                          .collectionDetails()!
                          .royalty
                          .toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 17.3.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  getBasicNftContainer(
      {int index = 0, required CollectionsProvider collectionProvider}) {
    bool isLiked = false;

    return GestureDetector(
      onTap: () {
        print(
            "${collectionProvider.allNFTOfCollection()!.chain!} +  ${collectionProvider.allNFTOfCollection()!.nftCollectionList!.elementAt(index).nftContractAddress!} + ${collectionProvider.allNFTOfCollection()!.nftCollectionList!.elementAt(index).nftTokenId!} ");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NFTDetailsPage(
                tokenId: collectionProvider
                    .allNFTOfCollection()!
                    .nftCollectionList!
                    .elementAt(index)
                    .nftTokenId!,
                chain: collectionProvider.allNFTOfCollection()!.chain!,
                contractAddress: collectionProvider
                    .allNFTOfCollection()!
                    .nftCollectionList!
                    .elementAt(index)
                    .nftContractAddress!),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0XFF141414)),
        child: Column(
          children: [
            Container(
              width: 157.h,
              height: 157.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  30,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  collectionProvider
                              .allNFTOfCollection()!
                              .nftCollectionList!
                              .elementAt(index)
                              .nftImage ==
                          ""
                      ? collectionProvider
                          .allNFTOfCollection()!
                          .nftCollectionList!
                          .elementAt(index)
                          .ipfsImage!
                      : collectionProvider
                          .allNFTOfCollection()!
                          .nftCollectionList!
                          .elementAt(index)
                          .nftImage!,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 14.w,
                right: 11.w,
                top: 5.h,
                bottom: 14.h,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "${collectionProvider.allNFTOfCollection()!.nftCollectionList!.elementAt(index).nftPrice} ETH",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(
                            0XFFBEF56E,
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          isLiked = !isLiked;
                          setState(() {});
                        },
                        child: Container(
                          width: 21.w,
                          height: 21.h,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0XFFFFFFFF),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.favorite_outline_outlined,
                              color: Colors.white,
                              size: 13,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "${collectionProvider.allNFTOfCollection()!.nftCollectionList!.elementAt(index).nftRarityRank}",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 11.h,
                      ),
                      Text(
                        "${collectionProvider.allNFTOfCollection()!.nftCollectionList!.elementAt(index).nftRarityNumber!.substring(0, 3)}",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Color(0XFFDADADA),
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 60.w,
                        height: 22.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: const Color(0XFFBEF56E))),
                        child: Center(
                          child: Text(
                            "Buy",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      Container(
                        width: 22.w,
                        height: 22.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0XFFBEF56E))),
                        child: Center(
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                            size: 14.w,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getProNftContainer(
      {int index = 0, required CollectionsProvider collectionProvider}) {
    bool isLiked = false;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NFTDetailsPage(
                tokenId: collectionProvider
                    .allNFTOfCollection()!
                    .nftCollectionList!
                    .elementAt(index)
                    .nftTokenId!,
                chain: collectionProvider.allNFTOfCollection()!.chain!,
                contractAddress: collectionProvider
                    .allNFTOfCollection()!
                    .nftCollectionList!
                    .elementAt(index)
                    .nftContractAddress!),
          ),
        );
      },
      child: Container(
        width: 157.w,
        height: 302.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0XFF141414)),
        child: Column(
          children: [
            Container(
              width: 157.h,
              height: 157.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  30,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  collectionProvider
                              .allNFTOfCollection()!
                              .nftCollectionList!
                              .elementAt(index)
                              .nftImage ==
                          ""
                      ? collectionProvider
                          .allNFTOfCollection()!
                          .nftCollectionList!
                          .elementAt(index)
                          .ipfsImage!
                      : collectionProvider
                          .allNFTOfCollection()!
                          .nftCollectionList!
                          .elementAt(index)
                          .nftImage!,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 14.w,
                right: 11.w,
                top: 5.h,
                bottom: 14.h,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "${collectionProvider.allNFTOfCollection()!.nftCollectionList!.elementAt(index).nftPrice} ETH",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(
                            0XFFBEF56E,
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          isLiked = !isLiked;
                          setState(() {});
                        },
                        child: Container(
                          width: 21.w,
                          height: 21.h,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0XFFFFFFFF),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.favorite_outline_outlined,
                              color: Colors.white,
                              size: 13,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "${collectionProvider.allNFTOfCollection()!.nftCollectionList!.elementAt(index).nftRarityRank}",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 11.h,
                      ),
                      Text(
                        "Rarity : ${collectionProvider.allNFTOfCollection()!.nftCollectionList!.elementAt(index).nftRarityNumber!.substring(0, 3)}",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Color(0XFFDADADA),
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Top Bid :",
                            style: TextStyle(
                              fontSize: 7.1.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0XFFDADADA),
                            ),
                            children: [
                              TextSpan(
                                  text:
                                      "${collectionProvider.allNFTOfCollection()!.nftCollectionList!.elementAt(index).nftPrice} ETH",
                                  style: TextStyle(
                                    fontSize: 8.41.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0XFFDADADA),
                                  ))
                            ]),
                      ),
                      const Spacer(),
                      RichText(
                        text: TextSpan(
                            text: "Held : ",
                            style: TextStyle(
                              fontSize: 7.1.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0XFFDADADA),
                            ),
                            children: [
                              TextSpan(
                                  text:
                                      "${collectionProvider.allNFTOfCollection()!.nftCollectionList!.elementAt(index).owners}",
                                  style: TextStyle(
                                    fontSize: 8.41.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0XFFDADADA),
                                  ))
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Last Sale :",
                            style: TextStyle(
                              fontSize: 7.1.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0XFFDADADA),
                            ),
                            children: [
                              TextSpan(
                                  text:
                                      "${collectionProvider.allNFTOfCollection()!.nftCollectionList!.elementAt(index).nftLastSale} ETH",
                                  style: TextStyle(
                                    fontSize: 8.41.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0XFFDADADA),
                                  ))
                            ]),
                      ),
                      const Spacer(),
                      Text.rich(
                        TextSpan(text: "", children: [
                          const WidgetSpan(
                              child: Icon(
                            Icons.history,
                            size: 14,
                            color: Colors.white,
                          )),
                          TextSpan(
                              text: "8h ago",
                              style: TextStyle(
                                fontSize: 8.41.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0XFFDADADA),
                              ))
                        ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Owner :",
                            style: TextStyle(
                              fontSize: 7.1.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0XFFDADADA),
                            ),
                            children: [
                              TextSpan(
                                  text:
                                      "${collectionProvider.allNFTOfCollection()!.nftCollectionList!.elementAt(index).owners}",
                                  style: TextStyle(
                                    fontSize: 8.41.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0XFFDADADA),
                                  ))
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 60.w,
                        height: 22.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: const Color(0XFFBEF56E))),
                        child: Center(
                          child: Text(
                            "Buy",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      Container(
                        width: 22.w,
                        height: 22.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0XFFBEF56E))),
                        child: Center(
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                            size: 14.w,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
