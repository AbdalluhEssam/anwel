import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantModel {
  final String name;
  final String logoPath;
  final String eta;

  RestaurantModel({required this.name, required this.logoPath, required this.eta});
}

class NearbyRestaurantsSection extends StatelessWidget {
  const NearbyRestaurantsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurants = [
      RestaurantModel(name: 'Allo Beirut', logoPath: 'assets/images/allo.png', eta: '32 mins'),
      RestaurantModel(name: 'Laffah', logoPath: 'assets/images/laffah.png', eta: '38 mins'),
      RestaurantModel(name: 'Falafil Al Rabeah', logoPath: 'assets/images/falafil.png', eta: '44 mins'),
      RestaurantModel(name: 'Barbar', logoPath: 'assets/images/barbar.png', eta: '34 mins'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Popular restaurants nearby", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
        12.verticalSpace,
        SizedBox(
          height: 90.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: restaurants.length,
            separatorBuilder: (_, __) => 12.horizontalSpace,
            itemBuilder: (_, i) {
              final rest = restaurants[i];
              return Column(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage: AssetImage(rest.logoPath),
                  ),
                  4.verticalSpace,
                  Text(rest.name, style: TextStyle(fontSize: 12.sp), overflow: TextOverflow.ellipsis),
                  Text(rest.eta, style: TextStyle(fontSize: 10.sp, color: Colors.grey)),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}