import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';

import '../../core/app_enum.dart';
import 'location_event.dart';
import 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  double? latitudeCurrent, longitudeCurrent;
  BitmapDescriptor? customIcon;
  GoogleMapController? mapController;
  Marker? markerLocation;
  TextEditingController destinationController = TextEditingController();
  LocationBloc() : super(LocationState()) {
    on<LocationEvent>((event, emit) async {
      if (event is CurrentLocation) {
        emit(state.copyWith(screenStates: ScreenStates.loading));
        await getPosition();
        if (latitudeCurrent == null) {
          emit(ExitLocation());
        } else {
          setMarker();
          emit(state.copyWith(
            screenStates: ScreenStates.success,
            latitude: latitudeCurrent,
            longitude: longitudeCurrent,
          ));
        }
      }

      if (event is ChangeLocationMarker) {
        markerLocation = Marker(
          icon: customIcon!,
          markerId: MarkerId(event.latLan.latitude.toString()),
          position: event.latLan,
          draggable: true,
        );
        emit(state.copyWith(
          screenStates: ScreenStates.success,
          latitude: event.latLan.latitude,
          longitude: event.latLan.longitude,
        ));
      }
    });
  }
setMarker()async{
  await BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(size: Size(1000, 1000)),
    IconsManager.locationIcon,
  ).then((icon) {
    customIcon = icon;
  });
  markerLocation = Marker(
    icon: customIcon!,
    markerId: MarkerId(latitudeCurrent.toString()),
    position: LatLng(latitudeCurrent ?? 0, longitudeCurrent ?? 0),
    draggable: true,
  );
}

  Future<void> getPosition() async {
    await determinePosition().then((value) {
      if (value == null) return;
      latitudeCurrent = value.latitude;
      longitudeCurrent = value.longitude;
    });
  }

  Future<Position?> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    try {
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location services are disabled.');
      }
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          return Future.error('Location services are disabled.');
        }
      }
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      return null;
    }
  }
}
