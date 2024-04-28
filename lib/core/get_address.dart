import '../models/user_address_response.dart';

String getAddress(UserAddressModel userAddressModel) {
  final name = userAddressModel.name;
  final area = userAddressModel.area;
  final street = userAddressModel.street;
  final building = userAddressModel.building;
  final floor = userAddressModel.floor;

  final namePart = name != null ? "$name  " : "";
  final areaPart = area != null ? "$area - " : "";
  final streetPart = street != null ? "$street - " : "";
  final buildingPart = building != null ? "$building - " : "";
  final floorPart = floor != null ? "$floor - " : "";

  return "$areaPart$streetPart$buildingPart$floorPart$namePart".trimRight();
}