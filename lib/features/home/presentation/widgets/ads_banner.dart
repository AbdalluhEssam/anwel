import 'package:anwel/core/constants/app_assets.dart';
import 'package:anwel/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdsBanner extends StatefulWidget {
  const AdsBanner({super.key});

  @override
  State<AdsBanner> createState() => _AdsBannerState();
}

class _AdsBannerState extends State<AdsBanner> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  final int pageCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160.0.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: pageCount,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0.r),
                child: Image.asset(
                  AppAssets.banner,
                  height: 180.0.h,
                  // width: double.infinity,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        8.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            pageCount,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin:  EdgeInsets.symmetric(horizontal: 3.0.w),
              width: 8.w,
              height: 8.0.h,
              decoration: BoxDecoration(
                color: index == currentIndex
                    ? AppColor.primaryColor
                    : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
