import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';

import 'datastore_keys.dart';

class DataStore {
  DataStore._internal();

  static final DataStore _instance = DataStore._internal();

  static DataStore get instance => _instance;

  late Box<dynamic> box;

  Future<void> init() async {
    await Hive.initFlutter();

    box = await Hive.openBox(DataStoreKeys.box);
    log("Datastore initialized", name: "$runtimeType");
  }

  /// Lang
  String get lang => box.get(DataStoreKeys.lang, defaultValue: "en")!;

  Future<void> setLang(String value) => box.put(DataStoreKeys.lang, value);

  /// User Info
  // Future<void> setUserInfo(LoginResponse value) =>
  //     box.put(DataStoreKeys.userInfo, value);
  //
  // LoginResponse? get userInfo {
  //   if (!box.containsKey(DataStoreKeys.userInfo)) return null;
  //   return box.get(DataStoreKeys.userInfo);
  // }

  void deleteUserInfo() => box.deleteAll({DataStoreKeys.userInfo});

  /// Token
  bool get hasToken => box.containsKey(DataStoreKeys.token);

  String? get token {
    if (!box.containsKey(DataStoreKeys.token)) return null;
    return "${box.get(DataStoreKeys.token)}";
  }

  Future<void> setToken(String value) => box.put(DataStoreKeys.token, value);

  void deleteToken() => box.deleteAll({DataStoreKeys.token});

  /// DYNAMIC Data
  Future<void> setDynamicData<T>(String key, T value) async {
    await box.put(key, value);
  }
  bool? get isShowOnBoarding {
    if (!box.containsKey(DataStoreKeys.onBoarding)) return false;
    return box.get(DataStoreKeys.onBoarding);
  }

  Future<void> setShowOnBoarding(bool value) =>
      box.put(DataStoreKeys.onBoarding, value);

  dynamic dynamicData<T>(String key) {
    if (!box.containsKey(key)) return null;
    if (box.get(key) is! T) {
      box.deleteAll({key});
      return null;
    }
    return box.get(key);
  }

  void deleteDynamicData() => box.deleteAll({DataStoreKeys.post});
}
