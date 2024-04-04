import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trikon_app/screens/collection_details_screen.dart';
import 'package:trikon_app/screens/nft_details_screen.dart';
import 'package:trikon_app/screens/user_nft_dashboard_screen.dart';

import '../providers/collectionsProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool priceInEth = true;
  bool priceInUsd = false;
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<CollectionsProvider>(context, listen: false)
        .getAllTopCollections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserDashboardScreen(),
            ),
          );
        },
      ),
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.black,
        title: CircleAvatar(
          radius: 25.w,
          backgroundColor: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.w),
            child: Image.network(
              "https://s3-alpha-sig.figma.com/img/56ec/16c9/00033b40ff92eb04d2eb3b595374fcc9?Expires=1709510400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=bYbMtAV5tfOkbdg-PyD5lfFKi53phVHmFstwIUztidvuJHfvedqSaXFYzonxkrQtSHNWxt8bxu8UJEmB5S9vNGF-69yaT2n-Q8UbAMumnoX2GBQ5YDBTiXnpPQGU3cfDbO96WAjmknfSwaejMdB8O~dhgIvN-Wn6zYzxxqpy-MhWRmqxp6OSc-96QYO2gNRhtaJZeuvHtqmrC85vwRl6WmIoSBYsepWYC~OXPOPJMPPk9u1b58kPY900gz7AnqTG03piaPVGPRiRLV1o~YoeB9opw15ut2umLF5ggl~akf-eJefRkwsvfJUgT-U8HxQCfMhTQ6Tb4FgIHAtrhF4BcA__",
              fit: BoxFit.fill,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Scaffold(
                      extendBodyBehindAppBar: true,
                      backgroundColor:
                          const Color.fromARGB(39, 84, 84, 84).withOpacity(.5),
                      body: Consumer<CollectionsProvider>(
                          builder: (context, collectionProvider, child) {
                        return Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: double.maxFinite,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 17.w,
                                  vertical: 21.h,
                                ),
                                height: 78.h,
                                color: Colors.black,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        width: 41.w,
                                        height: 41.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color:
                                                    const Color(0XFFE8ECF4))),
                                        child: const Center(
                                          child: Icon(
                                            Icons.keyboard_arrow_left,
                                            size: 20,
                                            color: Color(0XFFBEF56E),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        controller: _searchController,
                                        textInputAction: TextInputAction.go,
                                        textAlign: TextAlign.left,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          prefixIcon: const Icon(
                                            Icons.search,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: Color(0XFFBDC1C680),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: Color(0XFFBDC1C680),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                        onEditingComplete: () {
                                          if (_searchController
                                              .text.isNotEmpty) {
                                            collectionProvider
                                                .searchForCollection(
                                                    searchText:
                                                        _searchController.text);
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: GridView.count(
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 17.w, vertical: 20.h),
                                  childAspectRatio: .6,
                                  scrollDirection: Axis.vertical,
                                  mainAxisSpacing: 12.h,
                                  crossAxisSpacing: 12.w,
                                  children: List.generate(
                                    collectionProvider
                                        .searchedCollection()
                                        .length,
                                    (index) {
                                      return getSearchedCollectionsContainer(
                                          collectionProvider:
                                              collectionProvider,
                                          index: index);
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    );
                  });
            },
            child: Container(
              margin: EdgeInsets.only(right: 12.w),
              child: Icon(Icons.search, size: 32.w),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 12.w),
            child: Icon(
              Icons.help_outline,
              size: 32.w,
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 12.w),
              child: Icon(Icons.more_vert, size: 32.w)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "EXPLORE COLLECTIONS",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 17.h,
              ),
              SizedBox(
                height: 233.h,
                width: double.maxFinite,
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return getCollectionsContainer(index: index);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 21.w,
                    );
                  },
                  itemCount: 2,
                ),
              ),
              SizedBox(
                height: 45.h,
              ),
              SizedBox(
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
                    GestureDetector(
                      onTap: () {
                        priceInEth = true;
                        priceInUsd = false;

                        setState(() {});
                      },
                      child: Container(
                        width: 53.w,
                        height: 26.h,
                        decoration: BoxDecoration(
                          color: priceInEth
                              ? const Color(0XFFBEF56E)
                              : Colors.black,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            width: .3,
                            color: const Color(0XFFBDC1C6),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "ETH",
                            style: TextStyle(
                              color: priceInEth
                                  ? Colors.black
                                  : const Color(0XFFBDC1C6),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        priceInEth = false;
                        priceInUsd = true;
                        setState(() {});
                      },
                      child: Container(
                        width: 53.w,
                        height: 26.h,
                        decoration: BoxDecoration(
                          color: priceInUsd
                              ? const Color(0XFFBEF56E)
                              : Colors.black,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            width: .3,
                            color: const Color(0XFFBDC1C6),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "USD",
                            style: TextStyle(
                              color: priceInUsd
                                  ? Colors.black
                                  : const Color(0XFFBDC1C6),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 28.h,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "COLLECTIONS",
                      style: TextStyle(
                        color: const Color(0XFFBDC1C6),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "VOLUME",
                      style: TextStyle(
                        color: const Color(0XFFBDC1C6),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 11.h,
              ),
              const Divider(
                thickness: .2,
                color: Color(0XFFBDC1C6),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 300.h,
                child: Consumer<CollectionsProvider>(
                    builder: (context, collectionProvider, widget) {
                  if (collectionProvider.topCollection()?.topCollectionsList !=
                      null) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return getBriefCollectionDetailTile(
                            index: index,
                            collectionProvider: collectionProvider);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 15.h,
                        );
                      },
                      itemCount: collectionProvider
                                  .topCollection()!
                                  .topCollectionsList!
                                  .length >=
                              5
                          ? 5
                          : collectionProvider
                              .topCollection()!
                              .topCollectionsList!
                              .length,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(
                          0XFFBEF56E,
                        ),
                      ),
                    );
                  }
                }),
              ),
              SizedBox(
                height: 44.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 298.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      width: 1,
                      color: const Color(0XFFBEF56E),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0XFFBEF56E),
                        offset: Offset(-2, -2),
                        blurRadius: 5,
                        spreadRadius: 1.478,
                      ),
                      BoxShadow(
                        color: Color(0XFFBEF56E),
                        offset: Offset(2, 2),
                        blurRadius: 5,
                        spreadRadius: 1.478,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "SHOW MORE",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp,
                        color: const Color(0XFFBEF56E),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 79.h,
              ),
              Text(
                "TRENDING IN GAMING",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 210.h,
                width: double.maxFinite,
                child: Consumer<CollectionsProvider>(
                    builder: (context, collectionProvider, widget) {
                  return ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return getTrendinginGamingContainer(
                          index: index, collectionProvider: collectionProvider);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 21.w,
                      );
                    },
                    itemCount:
                        Provider.of<CollectionsProvider>(context, listen: false)
                            .allGamingCollection()
                            .length,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCollectionsContainer(
      {int index = 0, CollectionsProvider? collectionProvider}) {
    return Consumer<CollectionsProvider>(
        builder: (context, collectionProvider, child) {
      return Container(
          width: 190.w,
          height: 223.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              Positioned(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                child: Image.network(
                  index == 0
                      ? "https://s3-alpha-sig.figma.com/img/537e/6299/8ff702ec088f4668cf60ebf213d70e89?Expires=1709510400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LEVFcGSbDJXI1LE4bZrqnr1gfcfptAyKMiX4HzB-V2OPg0gH~5EDl0POsdXk0v3uCNIas9qJFLE8seQDpf19lPv9SZO4Y0QHoDAQv72waypz135IE4upD5xr2cFc9RrrIzvbKIkqqGJLvn4N0CI8unUedCDKeflHowZP932qYhQFSlOQuPbYrSj2-iaIO-ffs4HxlcsmN~UaDT5LhCKzukYbLy~QGMYj0g~AuETcdpIAdJML3tJbCZdaWxbFqdw~yQbvu2TtG9ah8UhGFlYFirCNNUw6jnqS4gUfuON9SMVHPuRwiO47tsvyZWXMaGDwgEduwb7fV75lCfnK1BCCWg__"
                      : "https://s3-alpha-sig.figma.com/img/c881/f5b7/21ea6815536e9b2939fd9c7bc260c7cf?Expires=1709510400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AGaTxBIm-1pAjFuCa-kTH0Dm7I7VKRGyk1oy7xnsPqMIZjzR0hiP4sckbdMzLY8mED7yeLaJWdhPg7Vn3rJgeEC-i2L7REIxUnah2rHzOfT0FReIZKDfiAqCU9qC9--e4cCWLy2I4ClmjZdxX7wo~83ab-Kp5wYNcF-~zz3Iji5Y53TF4u5KTqz7IdS4ywARWkAl8lxGsdi3qJW~rfV5Tfu71TjlmRe-DpuXmKTGmw4-RqDi6SFOSyupBy8DIKo9ZxXBwr74sRXE5yI2DnK6Ul1hzzQYauA5l0St-1NG3EWehhrpqsJiNENi~QpogcUJ7As0XA7wGkhZxmVQ2MAU4A__",
                  width: 190.w,
                  height: 223.h,
                  fit: BoxFit.fitHeight,
                ),
              )),
              Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.7),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    width: 190.w,
                    height: 56.h,
                    padding: EdgeInsets.only(left: 26.w, top: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              index == 0 ? "Azuki" : "Lil Pudgys",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            const Icon(
                              Icons.verified,
                              color: Color(0XFFBEF56E),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4.15.h,
                        ),
                        Text(
                          "Floor: 0.34 ETH",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ));
    });
  }

  Widget getSearchedCollectionsContainer(
      {int index = 0, CollectionsProvider? collectionProvider}) {
    return Consumer<CollectionsProvider>(
        builder: (context, collectionProvider, child) {
      return Container(
          width: 190.w,
          height: 223.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              Positioned(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                child: Image.network(
                  collectionProvider
                          .searchedCollection()
                          .elementAt(index)
                          .coverImage ??
                      "https://s3-alpha-sig.figma.com/img/c881/f5b7/21ea6815536e9b2939fd9c7bc260c7cf?Expires=1709510400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AGaTxBIm-1pAjFuCa-kTH0Dm7I7VKRGyk1oy7xnsPqMIZjzR0hiP4sckbdMzLY8mED7yeLaJWdhPg7Vn3rJgeEC-i2L7REIxUnah2rHzOfT0FReIZKDfiAqCU9qC9--e4cCWLy2I4ClmjZdxX7wo~83ab-Kp5wYNcF-~zz3Iji5Y53TF4u5KTqz7IdS4ywARWkAl8lxGsdi3qJW~rfV5Tfu71TjlmRe-DpuXmKTGmw4-RqDi6SFOSyupBy8DIKo9ZxXBwr74sRXE5yI2DnK6Ul1hzzQYauA5l0St-1NG3EWehhrpqsJiNENi~QpogcUJ7As0XA7wGkhZxmVQ2MAU4A__",
                  width: 190.w,
                  height: 223.h,
                  fit: BoxFit.fill,
                ),
              )),
              Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.7),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    width: 190.w,
                    padding: EdgeInsets.only(left: 10.w, top: 8.h, bottom: 8.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 120.w,
                          child: Text(
                            collectionProvider
                                    .searchedCollection()
                                    .elementAt(index)
                                    .name ??
                                "Azuki",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Icon(
                          Icons.verified,
                          color: Color(0XFFBEF56E),
                        )
                      ],
                    ),
                  )),
            ],
          ));
    });
  }

  Widget getTrendinginGamingContainer(
      {int index = 0, required CollectionsProvider collectionProvider}) {
    return Container(
      width: 181.w,
      height: 220.h,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              color: const Color(0XFFFFFFFF).withOpacity(.4),
              blurRadius: 6,
              spreadRadius: 0,
            )
          ]),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            height: 123.h,
            child: Image.network(
              collectionProvider
                      .allGamingCollection()
                      .elementAt(index)
                      .coverImage ??
                  "",
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0XFF1B1A1C),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 6.6.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 110.w,
                        child: Text(
                          collectionProvider
                                  .allGamingCollection()
                                  .elementAt(index)
                                  .name ??
                              "",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      const Icon(
                        Icons.verified,
                        color: Color(
                          0XFFBEF56E,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Floor",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0XFFC1C680).withOpacity(.5)),
                          ),
                          SizedBox(
                            width: 50.w,
                            child: Text(
                              "${collectionProvider.allGamingCollection().elementAt(index).floorPrice}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "24h Volume",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0XFFC1C680).withOpacity(.5)),
                          ),
                          SizedBox(
                            width: 80.w,
                            child: Text(
                              "${collectionProvider.allGamingCollection().elementAt(index).totalVolume} ETH ",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getBriefCollectionDetailTile(
      {int index = 0, required CollectionsProvider collectionProvider}) {
    return GestureDetector(
      onTap: () {
        if (collectionProvider
                    .topCollection()!
                    .topCollectionsList!
                    .elementAt(index)
                    .blockSpanKey !=
                null &&
            collectionProvider
                    .topCollection()!
                    .topCollectionsList!
                    .elementAt(index)
                    .chainType !=
                null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CollectionDetailScreen(
                spanKey: collectionProvider
                    .topCollection()!
                    .topCollectionsList!
                    .elementAt(index)
                    .blockSpanKey!,
                chain: collectionProvider
                    .topCollection()!
                    .topCollectionsList!
                    .elementAt(index)
                    .chainType!,
                contractAddress: collectionProvider
                    .topCollection()!
                    .topCollectionsList!
                    .elementAt(index)
                    .contracts!
                    .first,
              ),
            ),
          );
        }
      },
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${collectionProvider.topCollection()!.topCollectionsList!.elementAt(index).rank}.",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Container(
              width: 43.5.w,
              height: 45.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: .1,
                  color: const Color(0XFFFFFFFF),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(collectionProvider
                    .topCollection()!
                    .topCollectionsList!
                    .elementAt(index)
                    .coverImage!),
              ),
            ),
            SizedBox(
              width: 15.1.w,
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    collectionProvider
                        .topCollection()!
                        .topCollectionsList!
                        .elementAt(index)
                        .name!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(
                        0XFFBEF56E,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Text(
                    "Floor Price: ${collectionProvider.topCollection()!.topCollectionsList!.elementAt(index).floorPriceInEth}",
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80.w,
                    child: Text(
                      "${collectionProvider.topCollection()!.topCollectionsList!.elementAt(index).averagePrice!.substring(0, 3)} ETH",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  SizedBox(
                    width: 80.w,
                    child: Text(
                      "${collectionProvider.topCollection()!.topCollectionsList!.elementAt(index).oneDayVolumeChangePercent!.substring(0, 4)}%",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0XFFBEF56E),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
