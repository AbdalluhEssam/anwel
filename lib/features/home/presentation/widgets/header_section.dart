import 'package:anwel/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF8900FE),
            Color(0xFFFFDE59),
          ],
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      padding: EdgeInsets.all(32.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Delivering to\n",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "Al Satwa, 81A Street\n",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          height: 1.5,
                          color: Colors.black)),
                  TextSpan(
                      text: "Hi hepa!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          fontSize: 30.sp,
                          color: Colors.white)),
                ],
              ),
            ),
          ),
          CircleAvatar(
            radius: 34.r,
            backgroundImage: AssetImage(AppAssets.profileImage),
          )
        ],
      ),
    );
  }
}
