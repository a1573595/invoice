import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:invoice/data/repository/invoice_repository_impl.dart';
import 'package:invoice/domain/model/invoice_number.dart';

final homeUiStateProvider =
    AsyncNotifierProvider.autoDispose<HomeUiStateNotifier, InvoiceNumber>(HomeUiStateNotifier.new);

class HomeUiStateNotifier extends AutoDisposeAsyncNotifier<InvoiceNumber> {
  @override
  FutureOr<InvoiceNumber> build() => invoiceRepository.getInvoiceNumber();
}
