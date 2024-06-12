import 'package:dartz/dartz.dart';
import 'package:pharma/core/utils/api_const.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';
import 'package:pharma/data/data_resource/remote_resource/api_handler/base_api_client.dart';
import 'package:pharma/models/contact_us_model.dart';

class ContactUsRepo {
  static Future<Either<String, ContactUsModel>> contactUs({
    required String email,
    required String notes,
  }) {
    return BaseApiClient.post<ContactUsModel>(
      url: ApiConst.contactUs,
      queryParameters: {'lang':DataStore.instance.lang},
      formData: {
        "email": email,
        "notes": notes,
      },
      converter: (p0) {

        return ContactUsModel.fromJson(p0);
      },
    );
  }
}
