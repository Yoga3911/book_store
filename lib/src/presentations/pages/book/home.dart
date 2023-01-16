import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_nusantara/src/core/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selected = "Trending";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 130.h,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (_, idx) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: SizedBox(
                  width: 75.w,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColor.primary,
                        radius: 40.r,
                        child: CircleAvatar(
                          backgroundColor: AppColor.black,
                          radius: 38.r,
                          child: Padding(
                            padding: EdgeInsets.all(5.r),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/cana.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        "Coba",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        _typeData(selected),
        SizedBox(height: 30.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Image.asset(
            "assets/promo.png",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        SizedBox(height: 30.h),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                "Trending",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Show all",
                    style: GoogleFonts.poppins(
                      color: AppColor.primary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Icon(
                    Icons.arrow_circle_right_outlined,
                    color: AppColor.primary,
                    size: 25.r,
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 300.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const ScrollPhysics(),
            itemCount: 6,
            itemBuilder: (_, idx) {
              return Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: SizedBox(
                  width: 130.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200.h,
                        width: 130.w,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.grey,
                              offset: Offset(2, 2),
                              spreadRadius: 1,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10.r),
                          image: const DecorationImage(
                            image: AssetImage("assets/bg.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 7.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ini Judul",
                            style: GoogleFonts.poppins(
                              color: AppColor.primary,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Ini Deskripsi",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "10 Oktober 2022",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                ),
                              ),
                              Icon(
                                Icons.calendar_month,
                                color: Colors.white,
                                size: 15.r,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  StatefulBuilder _typeData(String selected) {
    return StatefulBuilder(
      builder: (_, setState) {
        return SizedBox(
          height: 50.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              GestureDetector(
                onTap: () {
                  selected = "Trending";
                  setState(() {});
                },
                child: _type(
                  title: "Trending",
                  icon: Icons.local_fire_department_outlined,
                  selected: selected,
                ),
              ),
              GestureDetector(
                onTap: () {
                  selected = "5 - Minutes Read";
                  setState(() {});
                },
                child: _type(
                  title: "5 - Minutes Read",
                  icon: Icons.menu_book_outlined,
                  selected: selected,
                ),
              ),
              GestureDetector(
                onTap: () {
                  selected = "Quick Listen";
                  setState(() {});
                },
                child: _type(
                  title: "Quick Listen",
                  icon: Icons.headphones_outlined,
                  selected: selected,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _type({
    required String title,
    required IconData icon,
    required String selected,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.symmetric(horizontal: 7.w),
      decoration: BoxDecoration(
        color: selected == title ? AppColor.primary : AppColor.black,
        borderRadius: BorderRadius.circular(50.r),
        border: Border.all(
          color: selected == title ? AppColor.primary : Colors.white,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: selected == title ? AppColor.black : Colors.white,
          ),
          SizedBox(width: 5.w),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: selected == title ? AppColor.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
