import 'package:carronamao/car_in_hand_app/models/car.dart';

class Recall {
  final int? id;
  final DateTime startYear;
  final DateTime stopYear;
  final Car car;
  final DateTime created;
  final DateTime? update;

  Recall({
    this.id,
    required this.startYear,
    required this.stopYear,
    required this.car,
    required this.created,
    required this.update,
  });
}
