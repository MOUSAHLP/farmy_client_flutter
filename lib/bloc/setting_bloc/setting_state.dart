abstract class SettingState {}

class SettingInit extends SettingState {}

class SettingSuccess extends SettingState {}

class SettingLoading extends SettingState {}

class SettingError extends SettingState {
  String error;
  SettingError(this.error);
}
