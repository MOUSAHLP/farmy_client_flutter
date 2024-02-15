import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/basket_repo.dart';
import 'package:pharma/models/params/payment_process_parms.dart';
import 'package:pharma/models/payment_process_response.dart';
import 'package:pharma/models/product_details_response.dart';

part 'basket_event.dart';

part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketRepo basketRepo;
  List<ProductDetailsResponse> mutableProducts = [];

  int countsProducts(int id) {
    if (mutableProducts.any((element) => element.id == id)) {
      int index = mutableProducts.indexWhere((element) => element.id == id);
      return mutableProducts[index].quantity ?? 0;
    }
    return 0;
  }

  int productPrice(int id) {
    int index = mutableProducts.indexWhere((element) => element.id == id);
    return (mutableProducts[index].quantity! *
        int.parse(mutableProducts[index].price ?? ''));
  }

  int finalPrice() {
    int sum = 0;
    for (int i = 0; i < mutableProducts.length; i++) {
      sum += (mutableProducts[i].quantity! *
          int.parse(mutableProducts[i].price ?? ''));
    }
    return sum;
  }

  BasketBloc({required this.basketRepo}) : super(const BasketState()) {
    on<BasketEvent>((event, emit) async {
      if (event is AddToBasket) {
        mutableProducts = List.from(state.prductList!);
        mutableProducts.add(event.product);

        emit(state.copyWith(
            prductList: mutableProducts,
            addToBasketState: AddToBasketState.successAddedToBasket));
      }
      if (event is PaymentProcess) {
        emit(state.copyWith(screenState: ScreenState.loading));
        PaymentProcessParms paymentProcessParms =
            PaymentProcessParms(prodictInBasketList: state.prductList!);
        (await basketRepo.getPaymentDetails(paymentProcessParms)).fold(
            (l) => emit(state.copyWith(
                screenState: ScreenState.error, errorMessage: l)),
            (r) => emit(state.copyWith(
                screenState: ScreenState.success, paymentProcessResponse: r)));
      }
      if (event is AddCount) {
        int index1 =
            mutableProducts.indexWhere((element) => element.id == event.id);

        mutableProducts[index1].quantity =
            mutableProducts[index1].quantity! + 1;

        emit(state.copyWith(
          prductList: mutableProducts,
        ));
      }
      if (event is MinusCount) {
        int index1 =
            mutableProducts.indexWhere((element) => element.id == event.id);

        if (mutableProducts[index1].quantity != 1) {
          mutableProducts[index1].quantity =
              mutableProducts[index1].quantity! - 1;
        }

        emit(state.copyWith(
          prductList: mutableProducts,
        ));
        // }
      }
      if (event is DeleteProduct) {
        mutableProducts.removeWhere((element) => element.id == event.id);
        emit(state.copyWith(
          prductList: mutableProducts,
        ));
      }
    });
  }
}
