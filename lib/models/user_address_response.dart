class UserAddressModel {
  UserAddressModel({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.area,
    this.street,
    this.building,
    this.buildingNumber,
    this.isFavorite,
    this.floor,
  });

  int? id;
  String? name;
  String? adress;
  String? latitude;
  String? longitude;
  String? area;
  String? street;
  String? building;
  String? buildingNumber;
  String? floor;
  String? isFavorite;

  UserAddressModel.fromJson(dynamic json) {
    id = int.parse(json['id'].toString());
    isFavorite = json["is_favourite"];
    name = json['name'];
    adress = json["address"];
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
