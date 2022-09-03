import 'package:carronamao/car_in_hand_app/models/vehicle.dart';

class Motorcycle extends Vehicle {
  final int? id;
  final DateTime created;
  final DateTime? update;

  Motorcycle({
    this.id,
    required brand,
    required model,
    required year,
    required this.created,
    this.update,
  }) : super(brand: brand, model: model, year: year);
}
