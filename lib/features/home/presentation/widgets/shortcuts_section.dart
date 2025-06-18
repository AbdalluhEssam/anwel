import 'package:anwel/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/home_model.dart';

class ShortcutsSection extends StatelessWidget {
  const ShortcutsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final shortcuts = [
      ShortcutModel(icon: AppAssets.icon1, label: 'Past orders'),
      ShortcutModel(icon: AppAssets.security, label: 'Super Saver'),
      ShortcutModel(icon: AppAssets.icon1, label: 'Must-tries'),
      ShortcutModel(icon: AppAssets.security, label: 'Give Back'),
      ShortcutModel(icon: AppAssets.icon1, label: 'Best Sellers'),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Shortcuts:",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
          18.verticalSpace,
          SizedBox(
            height: 80.0.h, // Adjusted to match the image height
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: shortcuts.length,
              separatorBuilder: (_, __) => SizedBox(width: 12.0),
              // Horizontal space between items
              itemBuilder: (_, i) {
                final item = shortcuts[i];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 60.0, // Fixed width to match the square design
                      height: 60.0, // Fixed height to match the square design
                      decoration: BoxDecoration(
                        color: Color(0xFFFDE4D0), // Light peach background
                        borderRadius:
                            BorderRadius.circular(12.0), // Rounded corners
                      ),
                      child: Center(
                        child: Image.asset(
                          item.icon,
                          width: 32.w,
                          height: 32.h,
                          fit: BoxFit.cover, // Ensure the image fits well
                        ),
                      ),
                    ),
                    SizedBox(height: 4.0),
                    // Vertical space between icon and text
                    Text(
                      item.label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
