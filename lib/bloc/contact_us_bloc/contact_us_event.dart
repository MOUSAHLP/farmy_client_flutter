part of 'contact_us_bloc.dart';

sealed class ContactUsEvent {
  const ContactUsEvent();
}

class SentInfo extends ContactUsEvent {
  final String email;
  final String notes;

  SentInfo({required this.email, required this.notes});
}
