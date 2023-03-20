// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:carronamao/car_in_hand_app/models/stick_node_status_enum.dart';
import 'package:carronamao/car_in_hand_app/models/kind_of_service.dart';
import 'package:carronamao/car_in_hand_app/utils/data_util.dart';

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

  factory StickNote.fromJson(Map<String, dynamic> json) {
    return StickNote(
        id: json['id'] as int,
        date: json['date'] as String,
        hour: json['hour'] as String,
        kindOfService: KindOfService.fromJson(json["kind_of_service"]),
        note: json['note'],
        status: getStickNodeStatusPorString(json["status"]),
        created: DateTime.parse(json["creation_date"]),
        update: DataUtil.convertStringToDateTimeOrNull(json["update_date"]));
  }

  static String toJsonString(StickNote stickNote, bool update) {
    Map<String, dynamic> json = {
      "date": stickNote.date,
      "hour": stickNote.hour,
      "kindOfService": stickNote.kindOfService.id,
      "note": stickNote.note,
      "status": stickNote.status.name,
      "creation_date":
          DataUtil.formatDateyyyyMMddHHmmssString(stickNote.created),
    };

    if (update) {
      json["update_date"] = DataUtil.formatDateyyyyMMddHHmmssString(
        stickNote.update ?? DateTime.now(),
      );
    }

    return jsonEncode(json);
  }
}
