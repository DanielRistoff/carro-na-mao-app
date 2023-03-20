import 'dart:convert';

import 'package:carronamao/car_in_hand_app/utils/data_util.dart';

class Recall {
  final int? id;
  final DateTime startYear;
  final DateTime stopYear;
  final DateTime createdDate;
  final DateTime? updateDate;

  Recall({
    this.id,
    required this.startYear,
    required this.stopYear,
    required this.createdDate,
    required this.updateDate,
  });

  factory Recall.fromJson(Map<String, dynamic> json) {
    return Recall(
      id: json['id'] as int,
      startYear: json['start_year'] as DateTime,
      stopYear: json['stop_year'] as DateTime,
      createdDate: json['created_date'] as DateTime,
      updateDate: DataUtil.convertStringToDateTimeOrNull(json['update_date']),
    );
  }

  static String toJsonString(Recall recall, bool update) {
    Map<String, dynamic> json = {
      "start_year": recall.startYear,
      "stop_year": recall.stopYear,
      "created_date":
          DataUtil.formatDateyyyyMMddHHmmssString(recall.createdDate),
    };

    if (update) {
      json["update_date"] = DataUtil.formatDateyyyyMMddHHmmssString(
        recall.updateDate ?? DateTime.now(),
      );
    }
    return jsonEncode(json);
  }
}
