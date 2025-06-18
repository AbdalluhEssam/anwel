import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anwel/core/theme/app_colors.dart';
import '../cubit/onboarding_cubit.dart';

class OnboardingFooter extends StatelessWidget {
  final PageController controller;
  final int totalPages;

  const OnboardingFooter({
    super.key,
    required this.controller,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, int>(
      builder: (context, currentPage) {
        final isLast = context.read<OnboardingCubit>().isLastPage(totalPages);

        if (!isLast) {
          return GestureDetector(
            onTap: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: Text(
              'Next',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColor.textColor,
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}