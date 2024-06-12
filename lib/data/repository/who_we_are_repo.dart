import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/who_we_are_model.dart';

class WhoWeAreRepo {
  static Future<Either<String, WhoWeAreModel>> getWhoWeAre() {
    return BaseApiClient.get<WhoWeAreModel>(
        url: ApiConst.getWhoWeAre,
        queryParameters: {
          'lang': DataStore.instance.lang,
        },
        converter: (e) {
          return WhoWeAreModel.fromJson(e);
        });
  }
}
