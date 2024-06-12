import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/condition_model.dart';

class ConditionsRepo {
  static Future<Either<String, ConditionModel>> getConditions() {
    return BaseApiClient.get<ConditionModel>(
      queryParameters: {'lang':DataStore.instance.lang},
        url: ApiConst.getConditions,
        converter: (e) {
          return ConditionModel.fromJson(e);
        });
  }
}
