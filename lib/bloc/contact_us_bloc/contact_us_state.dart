part of 'contact_us_bloc.dart';

class ContactUsState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String isError;

  const ContactUsState({
    required this.isLoading,
    required this.isSuccess,
    required this.isError,
  });

  ContactUsState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? isError,
  }) {
    return ContactUsState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        isSuccess,
        isError,
      ];
}
