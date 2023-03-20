import 'package:carronamao/car_in_hand_app/models/vehicle_stick_note.dart';
import 'package:carronamao/car_in_hand_app/utils/api_util.dart';
import 'package:http/http.dart' as http;

class VehicleStickNoteApi {
  static void createVehicleStickNote(VehicleStickNote vehicleStickNote) async {
    await http.post(
      ApiUtil.mountUri('/v1/public/vehicle-stick-note/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: VehicleStickNote.toJsonString(vehicleStickNote),
    );
  }

  static void updateVehicleStickNote(VehicleStickNote vehicleStickNote) async {
    http.Response response = await http.put(
      ApiUtil.mountUri('/v1/public/vehicle-stick-note/${vehicleStickNote.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: VehicleStickNote.toJsonString(vehicleStickNote),
    );
  }
}
