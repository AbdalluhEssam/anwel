import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../constants/app_assets.dart';

enum ViewState { loading, error, empty, success }

class HandleDataView extends StatelessWidget {
  final ViewState state;
  final Widget successWidget;
  final String? errorMessage;

  const HandleDataView({
    super.key,
    required this.state,
    required this.successWidget,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ViewState.loading:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(AppAssets.loading),
              Text(
                "Loading...",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        );
      case ViewState.error:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(AppAssets.lottieServer),
              24.verticalSpace,
              Text(
                errorMessage ?? "حدث خطأ ما 😢",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      case ViewState.empty:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(AppAssets.lottieEmpty),
              24.verticalSpace,
              Text(
                "لا توجد بيانات 😶",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      case ViewState.success:
        return successWidget;
    }
  }
}
