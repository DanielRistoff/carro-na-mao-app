import 'dart:convert';
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

  static String toJsonString(Vehicle vehicle) {
    Map<String, dynamic> json = {
      "board": vehicle.board,
      "current_mileage": vehicle.currentMileage,
      "average_monthly_mileage": vehicle.averageMonthlyMileage,
      "brand_model_year": vehicle.brandModelYear?.id,
    };
    return jsonEncode(json);
  }
}
