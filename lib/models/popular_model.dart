import 'package:fitness/enums/difficult.dart';

class PopularModel {
  String name;
  String iconPath;
  Difficult difficult;
  int time;
  int kcal;
  bool isActive;

  PopularModel({
    required this.name,
    required this.iconPath,
    required this.difficult,
    required this.time,
    required this.kcal,
    required this.isActive,
  });
}