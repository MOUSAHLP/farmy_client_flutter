import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/params/payment_process_parms.dart';
import 'package:pharma/models/payment_process_response.dart';

class BasketRepo {
  Future<Either<String, PaymentProcessResponse>> getPaymentDetails(
      PaymentProcessParams paymentProcessParams) {
    return BaseApiClient.post<PaymentProcessResponse>(
        formData: paymentProcessParams.toJson(),
        url: ApiConst.getPaymentDetails,
        converter: (e) {
          return PaymentProcessResponse.fromJson(e["data"]);
        });
  }
}
  