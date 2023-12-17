import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class LocationFirstEvent {
  LocationFirstEvent([List props = const []]) : super();
}

class CurrentLocation extends LocationFirstEvent {}
class Init extends LocationFirstEvent {}

class FilterVendors extends LocationFirstEvent {}

class ChangeLocationMarker extends LocationFirstEvent {
  LatLng latLan;
  ChangeLocationMarker(this.latLan);
}

class IndexIncrement extends LocationFirstEvent {}

class IndexDecrement extends LocationFirstEvent {}

class CheckIndex extends LocationFirstEvent {
  int index;
  CheckIndex(
    this.index,
  );
}

class ChangeLocationListFavoriteStatus extends LocationFirstEvent {
  final int vendorId;

  ChangeLocationListFavoriteStatus(
    this.vendorId,
  );
}
