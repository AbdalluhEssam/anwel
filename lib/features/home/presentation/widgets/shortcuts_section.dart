import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/home_model.dart';


class ShortcutsSection extends StatelessWidget {
  const ShortcutsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final shortcuts = [
      ShortcutModel(icon: Icons.history, label: 'Past orders'),
      ShortcutModel(icon: Icons.local_offer, label: 'Super Saver'),
      ShortcutModel(icon: Icons.star_border, label: 'Must-tries'),
      ShortcutModel(icon: Icons.favorite_border, label: 'Give Back'),
      ShortcutModel(icon: Icons.trending_up, label: 'Best Sellers'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Shortcuts:", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
        12.verticalSpace,
        SizedBox(
          height: 70.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: shortcuts.length,
            separatorBuilder: (_, __) => 12.horizontalSpace,
            itemBuilder: (_, i) {
              final item = shortcuts[i];
              return Column(
                children: [
                  CircleAvatar(
                    radius: 24.r,
                    backgroundColor: Colors.deepPurple.shade50,
                    child: Icon(item.icon, color: Colors.deepPurple),
                  ),
                  4.verticalSpace,
                  Text(item.label, style: TextStyle(fontSize: 12.sp)),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}