import 'package:invoice/data/network/api_service.dart';
import 'package:invoice/domain/model/invoice_number.dart';
import 'package:invoice/domain/network/invoice_api.dart';
import 'package:invoice/domain/repository/invoice_repository.dart';

final invoiceRepository = InvoiceRepositoryImpl(invoiceApi: ApiService.instance.invoiceApi);

class InvoiceRepositoryImpl implements InvoiceRepository {
  final InvoiceApi _api;

  const InvoiceRepositoryImpl({
    required InvoiceApi invoiceApi,
  }) : _api = invoiceApi;

  @override
  Future<InvoiceNumber> getInvoiceNumber() => _api.getInvoiceNumber().then(InvoiceNumber.fromRaw);
}
