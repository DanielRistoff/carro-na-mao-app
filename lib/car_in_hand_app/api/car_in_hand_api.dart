import 'dart:convert';
import 'package:carronamao/car_in_hand_app/models/stick_node_status_enum.dart';
import 'package:carronamao/car_in_hand_app/models/stick_note.dart';
import 'package:carronamao/car_in_hand_app/utils/api_util.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

class CarInHandApi {
  static void createStickNote(StickNote stickNote) async {
    await http.post(
      ApiUtil.mountUri('/v1/public/stick-note/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: StickNote.toJsonString(stickNote, false),
    );
  }

  static void updateStickNote(StickNote stickNote) async {
    http.Response response = await http.put(
        ApiUtil.mountUri('/v1/public/stick-note/${stickNote.id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: StickNote.toJsonString(stickNote, true));
  }

  static Future<List<StickNote>> getStickNotes() async {
    http.Response response =
        await http.get(ApiUtil.mountUri('/v1/public/stick-note/'));
    var dadosJson = json.decode(response.body);

    return prepareListStickNote(dadosJson);
  }

  static Future<ObservableList<StickNote>> getStickNotesByStatus(
    StickNodeStatusEnum status,
  ) async {
    http.Response response = await http.get(
      ApiUtil.mountUri(
        '/v1/public/stick-note/status/${getDescriptionStickNodeStatus(status).toUpperCase()}',
      ),
    );
    var dadosJson = json.decode(response.body);

    return prepareListStickNote(dadosJson);
  }

  static ObservableList<StickNote> prepareListStickNote(dynamic dadosJson) {
    final list = List<dynamic>.from(dadosJson);
    return ObservableList.of(list.map((json) => StickNote.fromJson(json)));
  }
}
