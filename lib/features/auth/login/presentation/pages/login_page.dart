import 'package:anwel/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_assets.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoginFailure) {
              return Center(child: Text('Error: ${state.error}'));
            }

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    70.verticalSpace,
                    Image.asset(
                      AppAssets.appLogo,
                      width: 300.w,
                      height: 300.h,
                      fit: BoxFit.cover,
                    ),
                    // Email Field
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        margin: EdgeInsets.only(bottom: 12.h),
                        child: CustomTextField(
                            hint: 'mail', icon: Icons.mail_outline)),

                    // Password Field
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      margin: EdgeInsets.only(bottom: 24.h),
                      child: CustomTextField(
                        hint: 'password',
                        icon: Icons.lock_outline,
                        obscure: true,
                      ),
                    ),

                    // Log in Button
                    SizedBox(
                      width: 343.w,
                      height: 45.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF9A00E6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    // Create account
                    12.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        // انتقل لصفحة التسجيل
                      },
                      child: Text(
                        'Create an account',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xFF1877F2),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
