import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/delivery_attributes_response.dart';
import 'package:pharma/models/params/Invoices_params.dart';
import 'package:pharma/models/params/payment_process_parms.dart';
import 'package:pharma/models/reward/reward_coupons_fixed_value.dart';

import '../../models/payment_process_response.dart';

  class PaymentRepo {
     Future<Either<String, PaymentProcessResponse>> getInvoiceDetails(PaymentProcessParams paymentProcessParams, InvoicesParams invoicesParams) {
      return BaseApiClient.post<PaymentProcessResponse>(
          formData: paymentProcessParams.toJsonWithParams(invoicesParams),
          url: ApiConst.getPaymentDetails,
          converter: (e) {
            return PaymentProcessResponse.fromJson(e["data"]);
          });
    }

  Future<Either<String, Map<String, dynamic>>> createOrder(PaymentProcessParams paymentProcessParams, InvoicesParams invoicesParams, List<DeliveryAttributesResponse>? deliveryAttributesList, List<int?>? deliveryChangesList,) {
    return BaseApiClient.post<Map<String, dynamic>>(
        formData: paymentProcessParams.createOrderToJsonWithParams(
            invoicesParams,
            deliveryAttributesList,
            paymentProcessParams.productInBasketList,
            deliveryChangesList),
        url: ApiConst.createOrders,
        converter: (e) {
          return e["data"];
        });
  }

  static Future<Either<String, RewardCouponsFixedValueModel>> getRewardCouponFixedValue() {
    return BaseApiClient.get<RewardCouponsFixedValueModel>(
        url: ApiConst.getRewardsOfferCoupon,
        converter: (e) {
          return RewardCouponsFixedValueModel.fromJson(e);
        });
  }


}
