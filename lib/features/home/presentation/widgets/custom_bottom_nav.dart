import 'package:anwel/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/home_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: context.watch<HomeCubit>().state,
      onTap: (i) => context.read<HomeCubit>().changePage(i),
      selectedItemColor: AppColor.primaryColor,
      unselectedItemColor: Color(0xFF484C52),
      selectedFontSize: 12,
      unselectedFontSize: 12,
      backgroundColor: Colors.white,
      elevation: 0,
      selectedLabelStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: AppColor.primaryColor,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: Color(0xFF484C52),
      ),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 24.sp),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined, size: 24.sp),
          label: "Categories",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.handshake_outlined, size: 24.sp),
          label: "Deliver",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined, size: 24.sp),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, size: 24.sp),
          label: "Profile",
        ),
      ],
    );
  }
}
