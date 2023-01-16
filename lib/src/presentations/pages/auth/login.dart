import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_nusantara/src/core/app_color.dart';
import 'package:test_nusantara/src/core/no_glow.dart';
import 'package:test_nusantara/src/widgets/button.dart';
import 'package:test_nusantara/src/widgets/text_field.dart';

import '../../../routes/route.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/bg.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Align(
            alignment: Alignment.center,
            child: ScrollConfiguration(
              behavior: NoGlow(),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 32.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      AppTextField(
                        hint: "Email",
                        isSecure: false,
                        controller: TextEditingController(),
                        icon: Icons.email_rounded,
                      ),
                      SizedBox(height: 20.h),
                      AppTextField(
                        hint: "Password",
                        isSecure: true,
                        controller: TextEditingController(),
                        icon: Icons.lock_rounded,
                      ),
                      SizedBox(height: 30.h),
                      AppButton(
                        onTap: () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.main,
                          (_) => false,
                        ),
                        isDisable: false,
                        title: "Continue",
                      ),
                      SizedBox(height: 30.h),
                      Text.rich(
                        TextSpan(
                          text: "Don't have an account?",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                          children: [
                            TextSpan(
                              text: " Sign Up",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: AppColor.primary,
                                fontSize: 14.sp,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pushNamed(
                                      context,
                                      Routes.register,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
