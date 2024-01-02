import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/models/params/complete_payment_parms.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(const BasketState()) {
    on<BasketEvent>((event, emit) {
      if (event is AddToBasket) {
        List<CompletePaymentParms> mutableProducts =
            List.from(state.completePaymentParms!);
        mutableProducts.add(event.completePaymentParms);

        emit(state.copyWith(
            completePaymentParms: mutableProducts,
            addToBasketState: AddToBasketState.successAddedToBasket));
        print(state.completePaymentParms!.length);
      }
    });
  }
}
