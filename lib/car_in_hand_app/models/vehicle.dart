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

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'] as int,
      board: json['board'] as String,
      currentMileage: json['current_mileage'] as int,
      averageMonthlyMileage: json['average_monthly_mileage'] as int,
      brandModelYear: BrandModelYear.fromJson(json['brand_model_year']),
    );
  }
}
