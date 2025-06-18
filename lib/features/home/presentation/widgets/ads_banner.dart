import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdsBanner extends StatelessWidget {
  const AdsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: PageView.builder(
        itemCount: 5,
        itemBuilder: (_, index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            image: const DecorationImage(
              image: AssetImage('assets/images/krispy_ad.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}