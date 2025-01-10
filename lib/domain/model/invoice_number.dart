import 'package:equatable/equatable.dart';
import 'package:invoice/common/i18n/l10n.dart';
import 'package:invoice/data/model/invoice_number_raw.dart';

class InvoiceNumber with EquatableMixin {
  final int year;
  final int month;
  final String specialPrize;
  final String grandPrize;
  final List<String> firstPrizeList;

  const InvoiceNumber({
    required this.year,
    required this.month,
    required this.specialPrize,
    required this.grandPrize,
    required this.firstPrizeList,
  });

  factory InvoiceNumber.fromRaw(InvoiceNumberRaw raw) => InvoiceNumber(
        year: raw.year ?? -1,
        month: raw.month ?? -1,
        specialPrize: raw.specialPrize ?? L10n.tr.nothing,
        grandPrize: raw.grandPrize ?? L10n.tr.nothing,
        firstPrizeList: raw.firstPrizeList.map((e) => e ?? L10n.tr.nothing).toList(),
      );

  @override
  List<Object?> get props => [
        year,
        month,
        specialPrize,
        grandPrize,
        firstPrizeList,
      ];
}
