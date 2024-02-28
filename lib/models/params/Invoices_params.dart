// ignore_for_file: public_member_api_docs, sort_constructors_first
class InvoicesParms {
  int userAddressid;
  int deliveryMethodId;
  String notes;
  InvoicesParms({
    required this.userAddressid,
    required this.deliveryMethodId,
    this.notes = "",
  });
}
