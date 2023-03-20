import 'dart:convert';
import 'package:carronamao/car_in_hand_app/utils/data_util.dart';

class PersonInformation {
  int? id;
  String? name;
  String? phoneNumber;
  String? login;
  String? password;
  String? email;
  bool notify;
  bool controlMaintenance;
  DateTime createdDate;
  DateTime? updateDate;

  PersonInformation({
    this.id,
    this.name,
    this.phoneNumber,
    this.login,
    this.password,
    this.email,
    required this.notify,
    required this.controlMaintenance,
    required this.createdDate,
    this.updateDate,
  });

  factory PersonInformation.fromJson(Map<String, dynamic> json) {
    return PersonInformation(
      id: json['id'] as int,
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as String,
      login: json['login'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      notify: json['notify'] as bool,
      controlMaintenance: json['control_maintenance'] as bool,
      createdDate: json['created_date'] as DateTime,
      updateDate: DataUtil.convertStringToDateTimeOrNull(json['update_date']),
    );
  }

  static String toJsonString(PersonInformation personInformation, bool update) {
    Map<String, dynamic> json = {
      "name": personInformation.name,
      "phone_number": personInformation.phoneNumber,
      "login": personInformation.login,
      "password": personInformation.password,
      "email": personInformation.email,
      "notify": personInformation.notify,
      "control_maintenance": personInformation.controlMaintenance,
      "creation_date": DataUtil.formatDateyyyyMMddHHmmssString(
          personInformation.createdDate),
    };

    if (update) {
      json["update_date"] = DataUtil.formatDateyyyyMMddHHmmssString(
        personInformation.updateDate ?? DateTime.now(),
      );
    }

    return jsonEncode(json);
  }
}
