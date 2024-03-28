
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import '../../data/repository/invoice_repository.dart';
import '../../data/repository/notification_repository.dart';
import 'invoices_event.dart';
import 'invoices_state.dart';

class InvoicesBloc extends Bloc<InvoicesEvent, InvoicesState> {
  InvoicesBloc() : super(InvoicesLoading()) {
    on<InvoicesEvent>((event, emit) async {
      if (event is GetInvoicesList) {
        emit(InvoicesLoading());
        final response = await InvoiceRepository.getInvoice();
        response.fold((l) {
          emit(InvoicesError(l));
        }, (r) {

          emit(InvoicesSuccess(r));
        });
      }
    });
  }
}
