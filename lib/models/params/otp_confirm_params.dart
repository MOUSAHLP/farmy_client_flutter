import 'package:pharma/data/data_resource/local_resource/data_store.dart';

class OtpConfirmParams {
  String? phone;
  String? code;

  OtpConfirmParams({this.phone, this.code});

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "code": code,
        'lang': DataStore.instance.lang,
      };
}
