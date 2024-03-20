abstract class SettingState {}

class SettingInit extends SettingState {}

class SettingSuccess extends SettingState {}

class SettingLoading extends SettingState {}

class SettingError extends SettingState {
  String error;

  SettingError(this.error);
}

extension SettingStateExtension on SettingState {
  bool get isLoading => this is SettingLoading;

  bool get isSuccess => this is SettingSuccess;
}
