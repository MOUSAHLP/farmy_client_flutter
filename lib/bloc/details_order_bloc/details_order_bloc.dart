import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import '../../data/repository/my_order_repository.dart';
import '../../models/order_details_model.dart';
import '../../models/params/product_edit_params.dart';
import 'details_order_event.dart';
import 'details_order_state.dart';

class DetailsOrderBloc extends Bloc<DetailsOrderEvent, DetailsOrderState> {
  List<OrderDetailsModel> productDetailsList = [];
  List<ProductEditPrams> product = [];
  int sum = 0;

  int countsProducts(int id) {
    if (productDetailsList.any((element) => element.id == id)) {
      int index = productDetailsList.indexWhere((element) => element.id == id);
      return productDetailsList[index].quantity ?? 0;
    }
    return 0;
  }

  int finalPrice() {
    double totalTax = 0;
    int totalProduct = 0;
    for (int i = 0; i < productDetailsList.length; i++) {
      if (productDetailsList[i].product?.discountStatus == "0") {
        totalProduct +=
            (int.parse(productDetailsList[i].product!.price ?? "0") *
                productDetailsList[i].quantity!);
        totalTax += ((productDetailsList[i].product?.tax ?? 0) / 100) *
            (int.parse(productDetailsList[i].product!.price ?? "0") *
                productDetailsList[i].quantity!);
      }
      if (productDetailsList[i].product?.discountStatus != "0") {
        totalProduct +=
            (int.parse(productDetailsList[i].product!.discountPrice ?? "0") *
                productDetailsList[i].quantity!);
        totalTax += ((productDetailsList[i].product?.tax ?? 0) / 100) *
            (int.parse(productDetailsList[i].product!.discountPrice ?? "0") *
                productDetailsList[i].quantity!);
      }
      print((((productDetailsList[i].product?.tax ?? 0) / 100) *
                  (int.parse(productDetailsList[i].product!.price ?? "0") *
                      productDetailsList[i].quantity!))
              .toString() +
          "tax%%%");
      print(((int.parse(productDetailsList[i].product!.price ?? "0") *
                  productDetailsList[i].quantity!))
              .toString() +
          "product%%%");
      // double totalTax = 0;
      // int totalProduct = 0;
      // for (int i = 0; i < productDetailsList.length; i++) {
      //   int reversedIndex = productInBasketList.length - 1 - i;

      //   // totalTax += (productDetailsList[i].tax ?? 0 *  int.parse(productDetailsList[i].discountPrice ?? "0"))/100;
      //   totalProduct += (int.parse(productDetailsList[i].discountPrice ?? "0") *
      //       productInBasketList[i].quantity);

      //   totalTax += ((productDetailsList[i].tax ?? 0) / 100) *
      //       (int.parse(productDetailsList[i].discountPrice ?? "0") *
      //           productInBasketList[i].quantity);
      // }
      // sum = totalProduct + totalTax.toInt();
      // return sum;
    }

    sum = totalProduct + totalTax.toInt();

    return sum;
  }

  DetailsOrderBloc() : super(DetailsOrderState()) {
    on<DetailsOrderEvent>((event, emit) async {
      if (event is ShowDetailsOrder) {
        emit(state.copyWith(screenStates: ScreenStates.loading));
        final response = await MyOrderRepository.getDetailsOrder(event.id);
        response.fold((l) {
          emit(state.copyWith(screenStates: ScreenStates.error));
        }, (r) {
          productDetailsList = r.homeCategoriesList ?? [];
          Map invoice = {
            "total": r.total,
            "subTotal": r.subTotal,
            "deliveryFee": r.deliveryFee,
            "tax": r.tax,
            "extra_discount": r.extra_discount,
            "couponDiscount": r.couponDiscount,
          };
          emit(
            state.copyWith(
              total: r.total,
              invoice: invoice,
              screenStates: ScreenStates.success,
              productList: productDetailsList,
              totalPrice: finalPrice(),
              urlPdf: r.pdfUrl,
            ),
          );
        });
      }
      if (event is AddCount) {
        int index1 =
            productDetailsList.indexWhere((element) => element.id == event.id);
        if (productDetailsList[index1].quantity! <
            productDetailsList[index1].product!.quantity!) {
          productDetailsList[index1].quantity =
              productDetailsList[index1].quantity! + 1;
          sum = 0;
          emit(
            state.copyWith(
                productList: productDetailsList, totalPrice: finalPrice()),
          );
        }
      }
      if (event is MinusCount) {
        int index1 =
            productDetailsList.indexWhere((element) => element.id == event.id);

        if (productDetailsList[index1].quantity != 1) {
          productDetailsList[index1].quantity =
              productDetailsList[index1].quantity! - 1;
        }
        sum = 0;
        emit(
          state.copyWith(
              productList: productDetailsList, totalPrice: finalPrice()),
        );
      }
      if (event is DeleteProduct) {
        productDetailsList
            .removeWhere((element) => element.product?.id == event.id);
        sum = 0;
        emit(state.copyWith(
            productList: productDetailsList, totalPrice: finalPrice()));
      }
      if (event is EditDetailsOrder) {
        emit(state.copyWith(isLoadingEdite: true));
        for (int i = 0; i < productDetailsList.length; i++) {
          product.add(ProductEditPrams(productDetailsList[i].product!.id,
              productDetailsList[i].quantity!));
        }
        final response = await MyOrderRepository.editOrder(event.id, product);
        response.fold((l) {
          emit(state.copyWith(errorEdit: l));
        }, (r) {
          // sl<MyOrderBloc>()
          //   .add(GetMyOrder());

          emit(state.copyWith(successEdit: true));
        });
      }
    });
  }
}
