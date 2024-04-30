import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pharma/models/product_response.dart';
import '../../core/app_enum.dart';

@immutable
class SearchState extends Equatable {
  final ScreenStates screenStates;
  List<ProductResponse> vendorsList;
  final String error;

  SearchState({
    this.screenStates = ScreenStates.initialized,
    this.vendorsList = const [],
    this.error = 'Unknown Error',
  }) : super();

  SearchState copyWith({
    List<ProductResponse>? vendorsList,
    ScreenStates? screenStates,
    String? error,
    bool? showLoadingDialog,
    bool? hasMoreData,
    bool? loadingPagenation,
  }) {
    return SearchState(
        screenStates: screenStates ?? this.screenStates,
        vendorsList: vendorsList ?? this.vendorsList,
        error: error ?? this.error);
  }

  @override
  List<Object?> get props => [
        identityHashCode(this),
        vendorsList,
        screenStates,
        error,
      ];
}
