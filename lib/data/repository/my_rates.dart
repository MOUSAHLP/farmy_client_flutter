import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/get_user_rates_model.dart';

class MyRatesRepo {
    static Future<Either<String, GetUserRatesModel>> getShowMyRates() {
    return BaseApiClient.get<GetUserRatesModel>(
        url: ApiConst.showRate,
        converter: (e) {
          return GetUserRatesModel.fromJson(e);
        });
  }
}
