import 'package:invoice/data/model/invoice_number_raw.dart';

abstract interface class InvoiceApi {
  Future<InvoiceNumberRaw> getInvoiceNumber();
}
