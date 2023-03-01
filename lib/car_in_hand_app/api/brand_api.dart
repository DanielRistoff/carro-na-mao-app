import 'dart:convert';
import 'package:carronamao/car_in_hand_app/models/brand.dart';
import 'package:carronamao/car_in_hand_app/models/stick_node_status_enum.dart';
import 'package:carronamao/car_in_hand_app/models/kind_of_service.dart';
import 'package:carronamao/car_in_hand_app/models/stick_note.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

class BrandApi {
  static Future<ObservableList<StickNote>> getBrandById(Brand brand) async {
    var uri = Uri(
      scheme: 'http',
      host: '10.0.2.2',
      port: 4200,
      path: '/v1/public/brand/${brand.id}',
    );

    http.Response response = await http.get(uri);
    var dadosJson = json.decode(response.body);

    return prepareBrand(dadosJson);
  }

  static ObservableList<StickNote> prepareBrand(dadosJson) {
    ObservableList<StickNote> stickNotes = ObservableList<StickNote>();
    for (var sticknNoteD in dadosJson) {
      StickNote stickNote = StickNote(
          id: sticknNoteD["id"],
          date: sticknNoteD["date"],
          hour: sticknNoteD["hour"],
          kindOfService: KindOfService(
              id: sticknNoteD["kind_of_service"]["id"],
              description: sticknNoteD["kind_of_service"]["description"]),
          note: sticknNoteD["note"],
          status: getStickNodeStatusPorString(sticknNoteD["status"]),
          created: DateTime.parse(sticknNoteD["creation_date"]),
          update: sticknNoteD["update_date"] != null
              ? DateTime.parse(sticknNoteD["update_date"])
              : null);
      stickNotes.add(stickNote);
    }
    return stickNotes;
  }
}
