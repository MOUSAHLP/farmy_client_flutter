import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/privacy_model.dart';

class PrivacyRepo {
  static Future<Either<String, PrivacyModel>> getPrivacy() {
    return BaseApiClient.get<PrivacyModel>(
        url: ApiConst.getPrivacy,
        queryParameters: {
          'lang': DataStore.instance.lang,
        },
        converter: (e) {
          return PrivacyModel.fromJson(e);
        });
  }
}
