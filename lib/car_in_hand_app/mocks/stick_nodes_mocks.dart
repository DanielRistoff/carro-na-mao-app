import 'package:carronamao/car_in_hand_app/models/stick_node_status_enum.dart';
import 'package:carronamao/car_in_hand_app/models/kind_of_service.dart';
import 'package:carronamao/car_in_hand_app/models/stick_note.dart';

class StickNodesMocks {
  static List<StickNote> getStickNodesListMock() {
    return [
      StickNote(
          id: 1,
          date: "10/12/2021",
          hour: "10:30",
          kindOfService: KindOfService(id: 1, description: "Troca de óleo"),
          note: "Problema com o parafuso do bujão do carter",
          status: StickNodeStatusEnum.CONCLUIDO,
          created: DateTime.now()),
      StickNote(
          id: 2,
          date: "21/01/2022",
          hour: "11:30",
          kindOfService: KindOfService(id: 2, description: "Calibrar Pneu"),
          note: "Sem Problema",
          status: StickNodeStatusEnum.CONCLUIDO,
          created: DateTime.now()),
      StickNote(
          id: 3,
          date: "02/02/2022",
          hour: "10:30",
          kindOfService: KindOfService(id: 2, description: "Calibrar Pneu"),
          note: "Sem Problema",
          status: StickNodeStatusEnum.CONCLUIDO,
          created: DateTime.now()),
      StickNote(
          id: 4,
          date: "10/12/2021",
          hour: "10:30",
          kindOfService: KindOfService(id: 1, description: "Troca de óleo"),
          note: "Trocou as velas",
          status: StickNodeStatusEnum.CONCLUIDO,
          created: DateTime.now())
    ];
  }
}
