import 'dart:convert';

import 'package:carronamao/car_in_hand_app/models/stick_node_status_enum.dart';
import 'package:carronamao/car_in_hand_app/models/kind_of_service.dart';
import 'package:carronamao/car_in_hand_app/models/stick_note.dart';
import 'package:carronamao/car_in_hand_app/models/vehicle.dart';
import 'package:carronamao/car_in_hand_app/utils/api_util.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

class VehicleApi {
  static void createVehicle(Vehicle vehicle) async {
    await http.post(
      ApiUtil.mountUri('/v1/public/vehicle/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "board": vehicle.board,
        "currentMileage": vehicle.currentMileage,
        "averageMonthlyMileage": vehicle.averageMonthlyMileage,
        "brandModelYear": vehicle.brandModelYear,
      }),
    );
  }

  static void updateVehicle(Vehicle vehicle) async {
    http.Response response = await http.put(
      ApiUtil.mountUri('/v1/public/person-information/${vehicle.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "board": vehicle.board,
        "currentMileage": vehicle.currentMileage,
        "averageMonthlyMileage": vehicle.averageMonthlyMileage,
        "brandModelYear": vehicle.brandModelYear,
      }),
    );
  }
}
