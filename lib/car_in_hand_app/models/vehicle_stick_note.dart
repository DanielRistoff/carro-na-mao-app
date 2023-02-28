import 'package:carronamao/car_in_hand_app/models/stick_note.dart';
import 'package:carronamao/car_in_hand_app/models/vehicle.dart';

class VehicleStickNote {
  final int id;
  final Vehicle vehicle;
  final StickNote stickNote;

  VehicleStickNote({
    required this.id,
    required this.vehicle,
    required this.stickNote,
  });
}
