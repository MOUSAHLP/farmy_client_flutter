import 'package:equatable/equatable.dart';

import '../../core/app_enum.dart';
import '../../models/order_details_model.dart';

class DetailsOrderState extends Equatable {
  ScreenStates screenStates;
  bool isLoading;
  bool isLoadingEdite;
  int totalPrice;
  int total;
  Map? invoice;
  String error;
  String urlPdf;
  String errorEdit;
  final bool success;
  final bool successEdit;
  List<OrderDetailsModel> productList;
  List<int> returnedProducts;

  DetailsOrderState({
    this.screenStates = ScreenStates.loading,
    this.isLoading = false,
    this.isLoadingEdite = false,
    this.success = false,
    this.successEdit = false,
    this.totalPrice = 0,
    this.total = 0,
    this.invoice = const {},
    this.error = '',
    this.urlPdf = '',
    this.errorEdit = '',
    this.productList = const [],
    this.returnedProducts = const [],
  });

  DetailsOrderState copyWith({
    ScreenStates? screenStates,
    bool? isLoading,
    bool? isLoadingEdite,
    bool? success,
    bool? successEdit,
    int? totalPrice,
    int? total,
    Map? invoice,
    String? error,
    String? urlPdf,
    String? errorEdit,
    List<OrderDetailsModel>? productList,
    List<int>? returnedProducts,
  }) {
    return DetailsOrderState(
      screenStates: screenStates ?? ScreenStates.initialized,
      isLoading: isLoading ?? false,
      isLoadingEdite: isLoadingEdite ?? false,
      success: success ?? false,
      successEdit: successEdit ?? false,
      error: error ?? '',
      urlPdf: urlPdf ?? this.urlPdf,
      errorEdit: errorEdit ?? '',
      productList: productList ?? this.productList,
      returnedProducts: returnedProducts ?? this.returnedProducts,
      totalPrice: totalPrice ?? this.totalPrice,
      total: total ?? this.total,
      invoice: invoice ?? this.invoice,
    );
  }

  @override
  List<Object?> get props => [
        identityHashCode(this),
        screenStates,
        isLoading,
        isLoadingEdite,
        success,
        successEdit,
        error,
        errorEdit,
        productList,
        returnedProducts,
        totalPrice,
        urlPdf,
        total,
        invoice
      ];
}
