import 'package:anwel/core/extensions/navigation_extensions.dart';
import 'package:anwel/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:anwel/core/constants/app_assets.dart';

import '../../../../core/routing/routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = const [
    {
      'title': "all-in-one delivery",
      'body':
          "Order groceries, medicines, and meals delivered straight to your door"
    },
    {
      'title': "User-to-User Delivery",
      'body': "Send or receive items from other users quickly and easily"
    },
    {
      'title': "Sales & Discounts",
      'body': "Discover exclusive sales and deals every day"
    },
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLastPage = currentPage == onboardingData.length - 1;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PositionedDirectional(
            top: 0,
            start: 0,
            child: SvgPicture.asset(
              AppAssets.onboardingSvg,
              width: 280.w,
              height: 280.h,
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            end: 0,
            child: Image.asset(
              AppAssets.onboardingBg,
              fit: BoxFit.cover,
              width: 280.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: onboardingData.length,
                    clipBehavior: Clip.none,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final data = onboardingData[index];
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
                            data['title']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          10.verticalSpace,
                          Text(
                            data['body']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColor.textColor,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                40.verticalSpace,
                SizedBox(
                  width: 295.w,
                  height: 40.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () {
                      context.pushNamedAndRemoveUntil(Routes.loginScreen);
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                12.verticalSpace,
                if (!isLastPage)
                  GestureDetector(
                    onTap: () {
                      if (!isLastPage) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        context.pushReplacementNamed(Routes.loginScreen);
                      }
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColor.textColor,
                      ),
                    ),
                  ),
                40.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
