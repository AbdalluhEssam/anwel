import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_assets.dart';

class ImageAuth extends StatelessWidget {
  const ImageAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        70.verticalSpace,
        Image.asset(
          AppAssets.appLogo,
          width: 300.w,
          height: 300.h,
          fit: BoxFit.cover,
        ),

      ],
    );
  }
}
