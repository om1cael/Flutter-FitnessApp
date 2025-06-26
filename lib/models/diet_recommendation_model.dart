import 'package:fitness/enums/difficult.dart';
import 'package:flutter/material.dart';

class DietRecommendationModel {
  String name;
  String iconPath;
  Color boxColor;
  Difficult difficult;
  int time;
  int kcal;
  bool hasActiveButton;

  DietRecommendationModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
    required this.difficult,
    required this.time,
    required this.kcal,
    required this.hasActiveButton,
  });
}