import 'package:anwel/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantModel {
  final String name;
  final String logoPath;
  final String eta;

  RestaurantModel(
      {required this.name, required this.logoPath, required this.eta});
}

class NearbyRestaurantsSection extends StatelessWidget {
  const NearbyRestaurantsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurants = [
      RestaurantModel(
          name: 'Allo Beirut', logoPath: AppAssets.restaurant1, eta: '32 mins'),
      RestaurantModel(
          name: 'Laffah', logoPath: AppAssets.restaurant1, eta: '38 mins'),
      RestaurantModel(
          name: 'Falafil Al Rabeah',
          logoPath: AppAssets.restaurant1,
          eta: '44 mins'),
      RestaurantModel(
          name: 'Barbar', logoPath: AppAssets.restaurant1, eta: '34 mins'),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Popular restaurants nearby",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
          16.verticalSpace,
          SizedBox(
            height: 110.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: restaurants.length,
              separatorBuilder: (context, __) => SizedBox(width: 12),
              itemBuilder: (context, i) {
                final rest = restaurants[i];
                return Column(
                  children: [
                    Container(
                      width: 80.w,
                      height: 70.w,
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xFFD9D9D9),
                          width: 1.w,
                        ),
                      ),
                      child: Image.asset(
                        rest.logoPath,
                        height: 50.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    8.verticalSpace,
                    Text(rest.name,
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis),
                    Row(
                      children: [
                        Icon(Icons.access_time,
                            size: 10.sp, color: Colors.black54),
                        2.horizontalSpace,
                        Text(rest.eta,
                            style:
                                TextStyle(fontSize: 10.sp, color:  Colors.black54))
                      ],
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
