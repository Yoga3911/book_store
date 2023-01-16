import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_nusantara/src/core/app_color.dart';
import 'package:test_nusantara/src/core/no_glow.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String selected = "Trending";
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Good Afternoon"),
            Container(
              color: AppColor.primary,
              width: 100.w,
              height: 3.h,
            )
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/cana.jpg"),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.black,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            activeIcon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Explore",
            activeIcon: Icon(Icons.search_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library_outlined),
            label: "Library",
            activeIcon: Icon(Icons.local_library_rounded),
          ),
        ],
      ),
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
          child: Column(
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
                        fontSize: 18.sp,
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
                            fontSize: 14.sp,
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
                height: 200.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const ScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (_, idx) {
                    return Column(
                      children: [
                        Container(
                          height: 200.h,
                          margin: EdgeInsets.symmetric(horizontal: 7.w),
                          width: 130.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/bg.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
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
