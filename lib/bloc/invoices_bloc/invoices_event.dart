abstract class InvoicesEvent {
  InvoicesEvent([List props = const []]) : super();
}

class GetInvoicesList extends InvoicesEvent {
  GetInvoicesList();
}
