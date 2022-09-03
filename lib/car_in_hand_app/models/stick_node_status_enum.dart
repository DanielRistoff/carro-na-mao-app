// ignore_for_file: constant_identifier_names

enum StickNodeStatusEnum {
  CONCLUIDO,
  PENDENTE,
  CANCELADO,
}

String getDescriptionStickNodeStatus(StickNodeStatusEnum stickNodeStatus) {
  switch (stickNodeStatus) {
    case StickNodeStatusEnum.CONCLUIDO:
      return 'Concluido';
    case StickNodeStatusEnum.PENDENTE:
      return 'Pendente';
    case StickNodeStatusEnum.CANCELADO:
      return 'Cancelado';
  }
}
