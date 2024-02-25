import 'package:equatable/equatable.dart';

class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class GetSetting extends SettingEvent {
  const GetSetting();
}
