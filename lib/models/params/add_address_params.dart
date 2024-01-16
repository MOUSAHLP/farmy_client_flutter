import 'package:equatable/equatable.dart';



class AddAddressParams extends Equatable {
  String? name;
 double? latitude;
 double? longitude;
 String? street;
 String? buildingNumber;
 String? building;
 String? floor;
 String? address;
 String? area;

   AddAddressParams({
    this.name,
    this.latitude,
    this.longitude,
    this.street,
    this.building,
    this.buildingNumber,
    this.floor,
    this.address,
    this.area
  });

  Map<String, dynamic> toJson() => {
         "name": name,
        "latitude": latitude ,
         "longitude": longitude ,
        "street": street,
        "building": building,
        "building_number": buildingNumber,
        "floor": floor,
        "address": address,
        "area": area,
      };
  factory AddAddressParams.fromGetHistoryParams(AddAddressParams params) =>
      AddAddressParams(
        name: params.name,
        street: params.street,
        latitude: params.latitude,
        longitude: params.longitude,
        building: params.building,
          buildingNumber: params.buildingNumber,
        floor: params.floor,
        address: params.address,
        area: params.area,



      );
  AddAddressParams copyWith({

    required String? name,
    required double? latitude,
    required double? longitude,
    required  String? street,
    required String? building,
    required String? buildingNumber,
    required String? floor,
    required String? address,
    required String? area,


  }) {
    return AddAddressParams(

      name: name,
      latitude: latitude,
      longitude: longitude,
      street: street,
      building: building,
      buildingNumber: buildingNumber,
      floor: floor,
      address: address,
      area: area,
    );
  }

  @override
  List<Object?> get props => [
        name,
    latitude,
    longitude,
    street,
    building,
    buildingNumber,
    floor,
    address,
    area,
      ];
}

