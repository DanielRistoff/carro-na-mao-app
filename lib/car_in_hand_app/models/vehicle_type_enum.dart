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
      return 'Caminhão';
    case VehicleTypeEnum.CAR:
      return 'Carro';
  }
}

VehicleTypeEnum getVehicleTypePorString(String vehicleType) {
  switch (vehicleType) {
    case "MOT":
      return VehicleTypeEnum.MOT;
    case "CAM":
      return VehicleTypeEnum.CAM;
    case "CAR":
      return VehicleTypeEnum.CAR;
  }
  return VehicleTypeEnum.CAR;
}
