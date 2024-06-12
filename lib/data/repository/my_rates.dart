import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/get_user_rates_model.dart';

import '../../models/rate_attribute.dart';

class MyRatesRepo {
  static Future<Either<String, GetUserRatesModel>> getShowMyRates() {
    return BaseApiClient.get<GetUserRatesModel>(
        url: ApiConst.showRate,
        queryParameters: {
          'lang': DataStore.instance.lang,
        },
        converter: (e) {
          return GetUserRatesModel.fromJson(e);
        });
  }

  static Future<Either<String, List<RateAttribute>>> getRateAttributes() {
    return BaseApiClient.get<List<RateAttribute>>(
        url: ApiConst.rateAttribute,
        queryParameters: {
          'lang': DataStore.instance.lang,
        },
        converter: (e) {
          return RateAttribute.listFromJson(e["data"]);
        });
  }

  static Future<Either<String, String>> submitRate(
      {required int orderId,required double rate,required List<SelectedRateAttribute> selectedAttribute}) {
    return BaseApiClient.post<String>(
        url: ApiConst.submitRate(orderId),
        queryParameters: {
          'lang': DataStore.instance.lang,
        },
        formData: {
          "rate": rate,
          "rate_attributes": selectedAttribute.map((e) => e.toJson()).toList(),
        },
        converter: (e) {
          return e["message"];
        });
  }
}
