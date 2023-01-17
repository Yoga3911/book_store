import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_nusantara/src/core/app_color.dart';
import 'package:test_nusantara/src/presentations/providers/user/login_provider.dart';
import 'package:test_nusantara/src/routes/route.dart';
import 'package:test_nusantara/src/widgets/list_tile.dart';

import '../../../data/storage/storage.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: const AssetImage("assets/cana.jpg"),
                    radius: 30.r,
                  ),
                  SizedBox(width: 7.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Doe",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "johndoe@gmail.com",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: const Center(child: Text("Premium")),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          const Divider(color: Colors.grey),
          SizedBox(height: 15.h),
          AppListTile(
            onTap: () {},
            icon: Icons.person_rounded,
            title: "Profile details",
          ),
          SizedBox(height: 10.h),
          AppListTile(
            onTap: () {},
            icon: Icons.payment_rounded,
            title: "Payment",
          ),
          SizedBox(height: 10.h),
          AppListTile(
            onTap: () {},
            icon: Icons.subscriptions_rounded,
            title: "Subscription",
          ),
          SizedBox(height: 15.h),
          const Divider(color: Colors.grey),
          SizedBox(height: 15.h),
          AppListTile(
            onTap: () {},
            icon: Icons.question_mark_rounded,
            title: "FAQs",
          ),
          SizedBox(height: 10.h),
          AppListTile(
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => AlertDialog(
                  backgroundColor: AppColor.black,
                  title: Text(
                    "Warning!",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  content: Text(
                    "Are you sure want logout from this account?",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.grey,
                      ),
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    ChangeNotifierProvider(
                      create: (_) => LoginProvider(),
                      builder: (ctx, _) {
                        final prov = ctx.read<LoginProvider>();
                        return ElevatedButton(
                          onPressed: () {
                            prov.logout().then(
                              (value) async {
                                if (value) {
                                  return Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    Routes.login,
                                    (route) => false,
                                  );
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      await AppStorage.load("error"),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            "Yes",
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
            icon: Icons.logout_rounded,
            title: "Logout",
          ),
        ],
      ),
    );
  }
}
