import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class LocationEvent {
  LocationEvent([List props = const []]) : super();
}

class CurrentLocation extends LocationEvent {}
class Init extends LocationEvent {}

class FilterVendors extends LocationEvent {}

class ChangeLocationMarker extends LocationEvent {
  LatLng latLan;
  ChangeLocationMarker(this.latLan);
}

class IndexIncrement extends LocationEvent {}

class IndexDecrement extends LocationEvent {}

class CheckIndex extends LocationEvent {
  int index;
  CheckIndex(
    this.index,
  );
}

class ChangeLocationListFavoriteStatus extends LocationEvent {
  final int vendorId;

  ChangeLocationListFavoriteStatus(
    this.vendorId,
  );
}
