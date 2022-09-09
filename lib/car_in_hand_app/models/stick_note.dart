// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:carronamao/car_in_hand_app/models/stick_node_status_enum.dart';
import 'package:carronamao/car_in_hand_app/models/kind_of_service.dart';

class StickNote {
  int? id;
  String date;
  String hour;
  KindOfService kindOfService;
  String? note;
  StickNodeStatusEnum status;
  DateTime created;
  DateTime? update;

  StickNote({
    this.id,
    required this.date,
    required this.hour,
    required this.kindOfService,
    this.note,
    required this.status,
    required this.created,
    this.update,
  });

  String getDateHourFormatted() {
    return "${date} ${hour}";
  }

  String getDescriptionStickNote() {
    return "${getDateHourFormatted()} - ${getDescriptionStickNodeStatus(status)} ${(note != '' && note != null) ? (" - $note") : ""} ";
  }
}
