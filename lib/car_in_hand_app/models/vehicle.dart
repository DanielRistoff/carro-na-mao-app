import 'package:carronamao/car_in_hand_app/models/brand_model_year.dart';

class Vehicle {
  final int? id;
  String? board;
  int? currentMileage;
  int? averageMonthlyMileage;
  final BrandModelYear? brandModelYear;
  Vehicle({
    this.id,
    this.board,
    this.currentMileage,
    this.averageMonthlyMileage,
    this.brandModelYear,
  });
}
