import 'package:anwel/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 89.h,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  AppAssets.security,
                  width: 80.w,
                  height: 78.9.h,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  AppAssets.nawelel,
                  width: 24.w,
                  height: 24.h,
                  alignment: Alignment.bottomLeft,
                ),
              ],
            ),
          ),
          8.horizontalSpace,
          // Text content
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Got a code !',
                  style: TextStyle(
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                2.verticalSpace,
                Text(
                  'Add your code and save on your order',
                  style: TextStyle(
                    fontSize: 11.sp,
                    height: 1.1,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
