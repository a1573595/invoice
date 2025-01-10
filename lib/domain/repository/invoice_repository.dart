import 'package:invoice/domain/model/invoice_number.dart';

abstract interface class InvoiceRepository {
  Future<InvoiceNumber> getInvoiceNumber();
}
