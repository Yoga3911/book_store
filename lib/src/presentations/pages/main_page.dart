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

  String _title = "";

  String selectGreeting(DateTime time) {
    if (time.hour >= 5 && time.hour <= 9) {
      return "Hai, Good Morning";
    } else if (time.hour >= 10 && time.hour <= 17) {
      return "Hai, Good Afternoon";
    } else {
      return "Hai, Good Evening";
    }
  }

  @override
  void initState() {
    _title = selectGreeting(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final time = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_title),
            Container(
              color: AppColor.primary,
              width: 100.w,
              height: 3.h,
            )
          ],
        ),
        actions: [
          if (_index != 2)
            Padding(
              padding: EdgeInsets.only(right: 5.w),
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/cana.jpg"),
              ),
            )
        ],
      ),
      floatingActionButton: (_index == 0)
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(
                Icons.search_rounded,
              ),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.black,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: Colors.white,
        currentIndex: _index,
        onTap: (val) {
          _index = val;
          if (val == 0) {
            _title = selectGreeting(time);
          } else if (val == 1) {
            _title = "My Library";
          } else if (val == 2) {
            _title = "Account Setting";
          }
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
