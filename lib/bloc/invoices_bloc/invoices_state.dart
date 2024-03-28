import '../../models/invoice_model.dart';
import '../../models/notification_model.dart';
abstract class InvoicesState {}

class InvoicesLoading extends InvoicesState {}

class InvoicesError extends InvoicesState {
  String error;
  InvoicesError(this.error);
}

class InvoicesSuccess extends InvoicesState {
  List<InvoiceModel> vendorsList;
  InvoicesSuccess(this.vendorsList);
}
class NotificationSuccessEnable extends InvoicesState {}