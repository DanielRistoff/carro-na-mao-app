import 'package:carronamao/car_in_hand_app/models/kind_of_service.dart';

class KindOfServiceMocks {
  List<KindOfService> getKindOfServices() {
    return <KindOfService>[
      KindOfService(id: 1, description: "Troca de óleo"),
      KindOfService(id: 2, description: "Troca de filtro de óleo"),
      KindOfService(id: 3, description: "Troca de filtro de ar"),
      KindOfService(id: 4, description: "Troca de filtro de gasolina"),
      KindOfService(id: 5, description: "Calibrar pneu"),
      KindOfService(id: 6, description: "Revisão básica"),
      KindOfService(id: 7, description: "Revisão Completa"),
      KindOfService(id: 8, description: "Revisão freios"),
      KindOfService(id: 9, description: "Outros"),
    ];
  }

  List<String> getKindOfServicesDescription() {
    List<String> list = [];
    getKindOfServices().forEach((element) {
      list.add(element.description);
    });
    return list;
  }

  KindOfService getKindOfServicePerDescription({required String description}) {
    return getKindOfServices().firstWhere((i) => i.description == description);
  }
}
