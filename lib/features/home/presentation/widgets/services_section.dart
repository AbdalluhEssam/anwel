import 'package:anwel/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/home_model.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      ServiceModel(
          iconPath: AppAssets.serv1, label: 'Food', subtitle: 'Up to 50%'),
      ServiceModel(
          iconPath: AppAssets.serv2,
          label: 'Health & wellness',
          subtitle: '20 mins'),
      ServiceModel(
          iconPath: AppAssets.serv3, label: 'Groceries', subtitle: '15 mins'),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Services:",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
          12.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: services
                .map((s) => Flexible(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: _ServiceCard(service: s),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final ServiceModel service;

  const _ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          child: Container(
            width: 105.w,
            height: 70.h,
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                service.iconPath,
                height: 50.h,
                width: 57.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          decoration: BoxDecoration(
            color: Color(0xFF8900FE),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(service.subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        Text(service.label,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black)),
      ],
    );
  }
}
