import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_nusantara/src/core/app_color.dart';
import 'package:test_nusantara/src/core/no_glow.dart';
import 'package:test_nusantara/src/data/models/user/register_model.dart';
import 'package:test_nusantara/src/presentations/providers/user/register_provider.dart';
import 'package:test_nusantara/src/routes/route.dart';
import 'package:test_nusantara/src/widgets/button.dart';
import 'package:test_nusantara/src/widgets/text_field.dart';

import '../../../data/storage/storage.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return ChangeNotifierProvider(
      create: (_) => RegisterProvider(),
      builder: (ctx, _) {
        final register = ctx.read<RegisterProvider>();
        return Form(
          key: formKey,
          child: Scaffold(
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
                                "Register",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 32.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            AppTextField(
                              hint: "Name",
                              isSecure: false,
                              controller: register.nameController,
                              icon: Icons.person_rounded,
                            ),
                            SizedBox(height: 20.h),
                            AppTextField(
                              hint: "Email",
                              isSecure: false,
                              controller: register.emailController,
                              icon: Icons.email_rounded,
                            ),
                            SizedBox(height: 20.h),
                            AppTextField(
                              hint: "Password",
                              isSecure: true,
                              controller: register.pass1Controller,
                              icon: Icons.lock_rounded,
                            ),
                            SizedBox(height: 20.h),
                            AppTextField(
                              hint: "Confirm Password",
                              isSecure: true,
                              controller: register.pass2Controller,
                              icon: Icons.lock_rounded,
                            ),
                            SizedBox(height: 20.h),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Consumer<RegisterProvider>(
                                    builder: (_, notifier, __) {
                                      return Checkbox(
                                        side: const BorderSide(
                                          color: Colors.white,
                                        ),
                                        activeColor: AppColor.primary,
                                        checkColor: Colors.black,
                                        value: notifier.getAgree,
                                        onChanged: (val) {
                                          register.setAgree = val!;
                                        },
                                      );
                                    },
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: "I agree to",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: " Terms of Service",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.primary,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " &",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " Privacy Policy",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.primary,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Consumer<RegisterProvider>(
                              builder: (_, notifier, __) {
                                return AppButton(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      register
                                          .register(
                                        model: RegisterModel(
                                          name: register.nameController.text,
                                          email: register.emailController.text,
                                          password:
                                              register.pass1Controller.text,
                                          passwordConfirmation:
                                              register.pass2Controller.text,
                                        ),
                                      )
                                          .then(
                                        (value) async {
                                          if (value) {
                                            return Navigator.pushNamed(
                                              context,
                                              Routes.login,
                                            );
                                          }
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                await AppStorage.load("error"),
                                              ),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                  title: "Create Account",
                                  isDisable: !notifier.getAgree,
                                );
                              },
                            ),
                            SizedBox(height: 30.h),
                            Text.rich(
                              TextSpan(
                                text: "Already have an account?",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                ),
                                children: [
                                  TextSpan(
                                    text: " Sign In",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.primary,
                                      fontSize: 14.sp,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Navigator.pop(context),
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
          ),
        );
      },
    );
  }
}
