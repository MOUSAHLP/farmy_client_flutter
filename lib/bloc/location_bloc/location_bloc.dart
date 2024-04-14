import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma/presentation/resources/assets_manager.dart';

import '../../core/app_enum.dart';
import '../../data/repository/user_address_repository.dart';
import '../../models/params/add_address_params.dart';
import '../../models/user_address_response.dart';
import 'location_event.dart';
import 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  double? latitudeCurrent, longitudeCurrent;
  BitmapDescriptor? customIcon;
  GoogleMapController? mapController;
  Marker markerLocation = const Marker(
    markerId: MarkerId(""),
    draggable: true,
  );
  List<UserAddressModel> userAddressList = [];
  final AddAddressParams address = AddAddressParams();
  // UserAddressModel addressCurrent = UserAddressModel();
  LocationBloc() : super(LocationState(addressCurrent: UserAddressModel())) {
    on<LocationEvent>((event, emit) async {
      if (event is CurrentLocation) {
        emit(state.copyWith(screenStates: ScreenStates.loading));
        await getPosition();
        if (latitudeCurrent == null) {
          emit(ExitLocation(addressCurrent: UserAddressModel()));
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
        address.latitude = event.latLan.latitude;
        address.longitude = event.latLan.longitude;
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
      if (event is GetUserAddress) {
        emit(state.copyWith(screenStates: ScreenStates.loading));
        final response = await UserAddressRepository.getUserAddress();
        response.fold((l) {
          if (l != 'Cancel') {
            emit(state.copyWith(screenStates: ScreenStates.error));
          }
        }, (r) {
          userAddressList = r;
          emit(state.copyWith(
              screenStates: ScreenStates.success, userAddressList: r));
        });
      }
      if (event is SearchByKeyword) {
        emit(state.copyWith(
            screenStates: ScreenStates.success,
            userAddressList: refreshShowingTasks(event.keyword)));
      }
      if (event is AddUserAddress) {
        emit(state.copyWith(isLoading: true));
        // address.latitude=state.latitude;
        // address.longitude=state.longitude;
        final response =
            await UserAddressRepository.addUserAddress(event.address);
        response.fold((l) {
          if (l != 'Cancel') {
            emit(state.copyWith(error: l));
          }
        }, (r) {
          // addressCurrent = r;
          emit(state.copyWith(success: true, addressCurrent: r));
        });
      }
      if (event is SelectLatLon) {
        emit(state.copyWith(
          latitude: event.lat,
          longitude: event.lon,
        ));
      }
      if (event is SelectAddressDelivery) {
        // addressCurrent = event.userAddress;
        emit(state.copyWith(isLoadingFavorite: true));
        (await UserAddressRepository.makeAdressFavorite(event.userAddress.id!))
            .fold(
                (l) => emit(state.copyWith(errorFavorite: l)),
                (r) => emit(state.copyWith(
                    successFavorite: true, addressCurrent: event.userAddress)));
      }
      if (event is DeleteUserAddress) {
        emit(state.copyWith(isLoadingDelete: true));
        final response = await UserAddressRepository.deleteAddress(event.id);
        response.fold((l) {
          if (l != 'Cancel') {
            emit(state.copyWith(errorDelete: l));
          }
        }, (r) {
          add(GetUserAddress());
          if (event.id == state.addressCurrent.id) {
            emit(state.copyWith(
                successDelete: true, addressCurrent: UserAddressModel()));
          } else {
            emit(state.copyWith(successDelete: true));
          }
        });
      }
    });
  }

  List<UserAddressModel> refreshShowingTasks(String? keyword,
      {int? selectedDayIndex}) {
    List<UserAddressModel> dayTasks = [...userAddressList];
    dayTasks.removeWhere((task) {
      if (keyword != null &&
          !(task.name!.toLowerCase().contains(keyword.toLowerCase())))
        return true;
      return false;
    });

    return dayTasks;
  }

  setMarker() async {
    await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(1000, 1000),
      ),
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
