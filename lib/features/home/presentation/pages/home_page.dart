import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/services_section.dart';
import '../widgets/shortcuts_section.dart';
import '../widgets/ads_banner.dart';
import '../widgets/nearby_restaurants.dart';
import '../widgets/header_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: const CustomBottomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              6.verticalSpace,
              const ServicesSection(),
              20.verticalSpace,
              const ShortcutsSection(),
              20.verticalSpace,
              const AdsBanner(),
              20.verticalSpace,
              const NearbyRestaurantsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
