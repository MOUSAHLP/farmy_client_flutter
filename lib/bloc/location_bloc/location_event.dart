import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/params/add_address_params.dart';

abstract class LocationEvent {
  LocationEvent([List props = const []]) : super();
}

class CurrentLocation extends LocationEvent {}
class Init extends LocationEvent {}

class ChangeLocationMarker extends LocationEvent {
  LatLng latLan;
  ChangeLocationMarker(this.latLan);
}
class GetUserAddress extends LocationEvent{}

class SearchByKeyword extends LocationEvent {
  String? keyword;
  SearchByKeyword({this.keyword});
}
class AddUserAddress extends LocationEvent {
  AddAddressParams address;
  AddUserAddress({required this.address});
}
class SelectLatLon extends LocationEvent {
  double lat;
  double lon;
  SelectLatLon({
    required this.lat,
    required this.lon,
  });
}
