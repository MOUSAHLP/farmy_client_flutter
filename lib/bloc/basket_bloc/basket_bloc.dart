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
  BasketBloc({required this.basketRepo}) : super(const BasketState()) {
    on<BasketEvent>((event, emit) async {
      if (event is AddToBasket) {
        List<ProductDetailsResponse> mutableProducts =
            List.from(state.prductList!);
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
    });
  }
}
