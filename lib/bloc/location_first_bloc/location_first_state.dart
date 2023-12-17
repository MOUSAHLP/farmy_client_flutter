
import 'package:equatable/equatable.dart';

import '../../core/app_enum.dart';

class LocationFirstState extends Equatable {
  ScreenStates screenStates;
  String error;
  final double latitude;
  final double longitude;

  int index;
  bool check;

  LocationFirstState({
    this.latitude = 0,
    this.longitude = 0.0,
    // this.vendorBinding = const [],
    this.index = -1,
    this.check = false,
    this.screenStates = ScreenStates.loading,
    this.error = '',
  });

  LocationFirstState copyWith({
    double? latitude,
    double? longitude,

    int? index,
    bool? check,
    ScreenStates? screenStates,
    String? error,
  }) {
    return LocationFirstState(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      check: check ?? this.check,
      screenStates: screenStates ?? this.screenStates,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        latitude,
        longitude,

        index,

        check,

        screenStates,
        error,
      ];
}

class ExitLocation extends LocationFirstState {}
