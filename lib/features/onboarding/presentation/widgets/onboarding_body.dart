import 'package:anwel/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anwel/core/widgets/custom_button.dart';
import 'package:anwel/core/extensions/navigation_extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../data/datasources/onboarding_local_datasource.dart';
import '../cubit/onboarding_cubit.dart';
import 'onboarding_footer.dart';
import 'onboarding_page_item.dart';

class OnboardingBody extends StatelessWidget {
   OnboardingBody({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                child: BlocBuilder<OnboardingCubit, int>(
                  builder: (context, currentPage) {
                    return PageView.builder(
                      controller: _controller,
                      itemCount: onboardingData.length,
                      clipBehavior: Clip.none,
                      onPageChanged: (index) => context.read<OnboardingCubit>().changePage(index),
                      itemBuilder: (context, index) {
                        final data = onboardingData[index];
                        return OnboardingPageItem(title: data['title']!, body: data['body']!);
                      },
                    );
                  },
                ),
              ),
              40.verticalSpace,
              CustomAuthButton(
                text: 'Get Started',
                onPressed: () {
                  context.pushNamedAndRemoveUntil(Routes.loginScreen);
                },
              ),
              12.verticalSpace,
              OnboardingFooter(
                controller: _controller,
                totalPages: onboardingData.length,
              ),
              40.verticalSpace,
            ],
          ),
        ),
      ],
    );
  }
}