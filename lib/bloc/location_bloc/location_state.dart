import 'package:equatable/equatable.dart';

import '../../core/app_enum.dart';
import '../../models/user_address_response.dart';

class LocationState extends Equatable {
  ScreenStates screenStates;

  bool isLoading;
  String error;
  final bool success;

  final double latitude;
  final double longitude;

  List<UserAddressModel> userAddressList;

  LocationState({
    this.screenStates = ScreenStates.loading,
    this.isLoading = false,
    this.success = false,
    this.error = '',
    this.latitude = 0,
    this.longitude = 0.0,
    this.userAddressList = const [],
  });

  LocationState copyWith({
    ScreenStates? screenStates,
    bool? isLoading,
    bool? success,
    String? error,
    double? latitude,
    double? longitude,
    List<UserAddressModel>? userAddressList,
  }) {
    return LocationState(
      screenStates: screenStates ?? this.screenStates,
      isLoading: isLoading ?? false,
      success: success ?? false,
      error: error ?? this.error,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      userAddressList: userAddressList ?? this.userAddressList,
    );
  }

  @override
  List<Object?> get props => [
        identityHashCode(this),
        screenStates,
        isLoading,
        success,
        error,
        latitude,
        longitude,
        userAddressList,
      ];
}

class ExitLocation extends LocationState {}
