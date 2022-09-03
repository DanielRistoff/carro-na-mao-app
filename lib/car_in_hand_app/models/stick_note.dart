// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:carronamao/car_in_hand_app/models/stick_node_status_enum.dart';
import 'package:carronamao/car_in_hand_app/models/kind_of_service.dart';

class StickNote {
  int? id;
  final String date;
  final String hour;
  final KindOfService kindOfService;
  final String note;
  final StickNodeStatusEnum status;
  final DateTime created;
  final DateTime? update;

  StickNote({
    this.id,
    required this.date,
    required this.hour,
    required this.kindOfService,
    required this.note,
    required this.status,
    required this.created,
    this.update,
  });

  String getDateHourFormatted() {
    return "${date} ${hour}";
  }

  String getDescriptionStickNote() {
    return "${getDateHourFormatted()} - ${getDescriptionStickNodeStatus(status)} ${note != '' ? (" - $note") : ""} ";
  }
}
