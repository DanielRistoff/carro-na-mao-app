import 'dart:convert';

import 'package:carronamao/car_in_hand_app/models/stick_node_status_enum.dart';
import 'package:carronamao/car_in_hand_app/models/kind_of_service.dart';
import 'package:carronamao/car_in_hand_app/models/stick_note.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class CarInHandApi {
  static Future<List<StickNote>> getStickNotes() async {
    var uri = Uri(
      scheme: 'http',
      host: '10.0.2.2',
      port: 4200,
      path: '/v1/public/stick-note/',
    );

    http.Response response = await http.get(uri);
    var dadosJson = json.decode(response.body);

    return prepareListStickNote(dadosJson);
  }

  static Future<List<StickNote>> getStickNotesByStatus(
      StickNodeStatusEnum status) async {
    var uri = Uri(
      scheme: 'http',
      host: '10.0.2.2',
      port: 4200,
      path:
          '/v1/public/stick-note/status/${getDescriptionStickNodeStatus(status).toUpperCase()}',
    );

    http.Response response = await http.get(uri);
    var dadosJson = json.decode(response.body);

    return prepareListStickNote(dadosJson);
  }

  static List<StickNote> prepareListStickNote(dadosJson) {
    List<StickNote> stickNotes = [];
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
          created: DateTime.parse(sticknNoteD["created"]),
          update: sticknNoteD["update"] != null
              ? DateTime.parse(sticknNoteD["update"])
              : null);
      stickNotes.add(stickNote);
    }
    return stickNotes;
  }
}