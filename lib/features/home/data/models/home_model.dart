import 'package:flutter/material.dart';

import '../../domain/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel() : super();

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    // TODO: Map JSON to model
    return HomeModel();
  }
}

class ServiceModel {
  final String iconPath;
  final String label;
  final String subtitle;

  ServiceModel({required this.iconPath, required this.label, required this.subtitle});
}

class ShortcutModel {
  final String icon;
  final String label;

  ShortcutModel({required this.icon, required this.label});
}
