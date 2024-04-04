import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDashboardScreen extends StatefulWidget {
  const UserDashboardScreen({super.key});

  @override
  State<UserDashboardScreen> createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 36.w,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff2D1E5F),
                  Color(0XFF101420),
                ],
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.w),
                        child: Image.network(
                            "https://s3-alpha-sig.figma.com/img/56ec/16c9/00033b40ff92eb04d2eb3b595374fcc9?Expires=1709510400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=bYbMtAV5tfOkbdg-PyD5lfFKi53phVHmFstwIUztidvuJHfvedqSaXFYzonxkrQtSHNWxt8bxu8UJEmB5S9vNGF-69yaT2n-Q8UbAMumnoX2GBQ5YDBTiXnpPQGU3cfDbO96WAjmknfSwaejMdB8O~dhgIvN-Wn6zYzxxqpy-MhWRmqxp6OSc-96QYO2gNRhtaJZeuvHtqmrC85vwRl6WmIoSBYsepWYC~OXPOPJMPPk9u1b58kPY900gz7AnqTG03piaPVGPRiRLV1o~YoeB9opw15ut2umLF5ggl~akf-eJefRkwsvfJUgT-U8HxQCfMhTQ6Tb4FgIHAtrhF4BcA__"),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.help_outline,
                        size: 32.w,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.more_vert,
                        size: 32.w,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 22.h,
                ),
                Text(
                  "57,147 MATIC",
                  style: TextStyle(
                      color: const Color(0XFFBEF56E),
                      fontWeight: FontWeight.w700,
                      fontSize: 36.sp),
                ),
                SizedBox(
                  height: 21.h,
                ),
                SizedBox(
                  width: 150,
                  child: Row(
                    children: [
                      Text(
                        "Total Balance",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 15.w,
                          height: 15.h,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.refresh,
                            color: Colors.black,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 39.h,
                ),
                SizedBox(
                  width: 321.w,
                  child: const Divider(
                    thickness: .5,
                    color: Color(0XFFBDC1C6),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                  width: 270.w,
                  height: 100.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            child: Image.asset("assets/buy.png"),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "BUY",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            child: Image.asset("assets/sell.png"),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "SEND",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            child: Image.asset("assets/swap.png"),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "SWAP",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
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
          SizedBox(
            height: 34.h,
          ),
          TabBar(
            controller: _tabController,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            labelStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            indicatorColor: const Color(0XFFBEF56E),
            indicatorWeight: 1.5,
            labelColor: const Color(0XFFBEF56E),
            unselectedLabelColor: const Color(0XFFBDC1C6),
            tabs: const [
              Tab(
                text: "TOKENS",
              ),
              Tab(
                text: "NFTS",
              )
            ],
          ),
          SizedBox(
            height: 80.h,
            child: TabBarView(controller: _tabController, children: [
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border(
                    top:
                        BorderSide(color: const Color(0XFFBDC1C6), width: .3.h),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 10.h,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/hillClimb.png",
                      height: 40.h,
                      width: 40.w,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 13.w,
                    ),
                    Text(
                      "Hill climb racing",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "355 HCR",
                      style: TextStyle(
                        color: const Color(
                          0XFFBEF56E,
                        ),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border(
                    top:
                        BorderSide(color: const Color(0XFFBDC1C6), width: .3.h),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 10.h,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/hillClimb.png",
                      height: 40.h,
                      width: 40.w,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 13.w,
                    ),
                    Text(
                      "Hill climb racing",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "355 HCR",
                      style: TextStyle(
                        color: const Color(
                          0XFFBEF56E,
                        ),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
