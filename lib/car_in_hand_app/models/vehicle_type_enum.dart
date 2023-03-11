// ignore_for_file: constant_identifier_names

enum VehicleTypeEnum {
  MOT,
  CAM,
  CAR,
}

String getDescriptionVehicleType(VehicleTypeEnum vehicleType) {
  switch (vehicleType) {
    case VehicleTypeEnum.MOT:
      return 'Moto';
    case VehicleTypeEnum.CAM:
      return 'Caminhao';
    case VehicleTypeEnum.CAR:
      return 'Carro';
  }
}

VehicleTypeEnum getVehicleTypePerString(String vehicleType) {
  switch (vehicleType) {
    case "Moto":
      return VehicleTypeEnum.MOT;
    case "Caminhao":
      return VehicleTypeEnum.CAM;
    case "Carro":
      return VehicleTypeEnum.CAR;
  }
  return VehicleTypeEnum.CAR;
}
