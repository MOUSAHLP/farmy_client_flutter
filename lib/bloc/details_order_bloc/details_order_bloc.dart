
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/core/app_enum.dart';
import '../../data/repository/my_order_repository.dart';
import '../../models/order_details_model.dart';
import 'details_order_event.dart';
import 'details_order_state.dart';

class DetailsOrderBloc extends Bloc<DetailsOrderEvent, DetailsOrderState> {
  List<OrderDetailsModel> productList=[];
  int sum = 0;
  int productPrice(int id) {
    int index = productList.indexWhere((element) => element.id == id);
    return (productList[index].product?.quantity??0 *
        int.parse(productList[index].product?.price ?? ''));
  }

  int countsProducts(int id) {
    if (productList.any((element) => element.id == id)) {
      int index = productList.indexWhere((element) => element.id == id);
      return productList[index].product?.quantity ?? 0;
    }
    return 0;
  }
  int finalPrice(){
    int totalTax=0;
    int totalProduct=0;
    for (int i = 0; i < productList.length; i++) {
      totalTax+=productList[i].product?.tax??0;
      totalProduct += (int.parse(productList[i].product!.price??"0") * productList[i].product!.quantity!);
    }
    sum=totalProduct+totalTax;
    return sum;
  }
  DetailsOrderBloc() : super(DetailsOrderState()) {
    on<DetailsOrderEvent>((event, emit) async {
      if(event is ShowDetailsOrder){
        emit(state.copyWith(screenStates: ScreenStates.loading));
        final response = await MyOrderRepository.getDetailsOrder(event.id);
        response.fold((l) {
          emit(state.copyWith(screenStates: ScreenStates.error));
        }, (r) {
          productList=r;

          emit(state.copyWith(screenStates: ScreenStates.success,productList:r,totalPrice: finalPrice() ));
        });
      }
      if (event is AddCount) {
        int index1 =
        productList.indexWhere((element) => element.id == event.id);
        productList[index1].product?.quantity =
            productList[index1].product!.quantity! + 1;
        sum=0;
        emit(
          state.copyWith(
            productList: productList,
              totalPrice: finalPrice()
          ),
        );
      }
      if (event is MinusCount) {
        int index1 =
        productList.indexWhere((element) => element.id == event.id);

        if (productList[index1].product?.quantity != 1) {
          productList[index1].product?.quantity =
              productList[index1].product!.quantity! - 1;

        }
        sum=0;
        emit(
          state.copyWith(
            productList: productList,
              totalPrice: finalPrice()
          ),
        );

      }
      if (event is DeleteProduct) {
        productList.removeWhere((element) => element.product?.id == event.id);
        sum=0;
        emit(state.copyWith(
          productList: productList,
          totalPrice:  finalPrice()
        ));
      }
    });
  }

}
