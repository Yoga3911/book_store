import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_nusantara/src/core/app_color.dart';
import 'package:test_nusantara/src/core/no_glow.dart';
import 'package:test_nusantara/src/presentations/pages/book/home.dart';
import 'package:test_nusantara/src/presentations/pages/library/library.dart';
import 'package:test_nusantara/src/presentations/pages/setting/setting.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;
  final List<Widget> _pageList = [
    const HomePage(),
    const LibraryPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
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
        currentIndex: _index,
        onTap: (val) {
          _index = val;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            activeIcon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library_outlined),
            label: "Library",
            activeIcon: Icon(Icons.local_library_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Setting",
            activeIcon: Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
          child: _pageList[_index],
        ),
      ),
    );
  }
}
