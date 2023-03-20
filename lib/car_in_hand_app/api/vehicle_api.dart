import 'package:carronamao/car_in_hand_app/models/vehicle.dart';
import 'package:carronamao/car_in_hand_app/utils/api_util.dart';
import 'package:http/http.dart' as http;

class VehicleApi {
  static void createVehicle(Vehicle vehicle) async {
    await http.post(
      ApiUtil.mountUri('/v1/public/vehicle/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: Vehicle.toJsonString(vehicle),
    );
  }

  static void updateVehicle(Vehicle vehicle) async {
    http.Response response = await http.put(
      ApiUtil.mountUri('/v1/public/person-information/${vehicle.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: Vehicle.toJsonString(vehicle),
    );
  }
}
