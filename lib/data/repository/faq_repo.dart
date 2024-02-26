import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/faq_model.dart';

class FAQRepo {
  static Future<Either<String, FAQModel>> getFAQ() {
    return BaseApiClient.get<FAQModel>(
        url: ApiConst.getFaqQuestions,
        converter: (e) {
          return FAQModel.fromJson(e);
        });
  }
}
