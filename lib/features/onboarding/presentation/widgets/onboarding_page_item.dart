import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:anwel/core/constants/app_assets.dart';
import 'package:anwel/core/theme/app_colors.dart';

class OnboardingPageItem extends StatelessWidget {
  final String title;
  final String body;

  const OnboardingPageItem({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          AppAssets.appLogo,
          width: 336.w,
          height: 336.h,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        10.verticalSpace,
        Text(
          body,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColor.textColor,
          ),
        ),
      ],
    );
  }
}