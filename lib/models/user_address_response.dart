import 'package:equatable/equatable.dart';

class UserAddressModel  {
  UserAddressModel({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.area,
    this.street,
    this.building,
    this.buildingNumber,
    this.floor,
  });

  int? id;
  String? name;
  String? latitude;
  String? longitude;
  String? area;
  String? street;
  String? building;
  String? buildingNumber;
  String? floor;

  UserAddressModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    area = json['area'];
    street = json['street'];
    building = json['building'];
    buildingNumber = json['building_number'];
    floor = json['floor'];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "latitude": latitude,
    "longitude": longitude,
    "area": area,
    "street": street,
    "building": building,
    "buildingNumber": buildingNumber,
    "floor": floor,
  };

  static List<UserAddressModel> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => UserAddressModel.fromJson(value)).toList();
  }

  // @override
  // List<Object?> get props => [
  //   identityHashCode(this),
  //   id,
  //   name,
  //   latitude,
  //   longitude,
  //   area,
  //   street,
  //   building,
  //   buildingNumber,
  //   floor,
  // ];
}
