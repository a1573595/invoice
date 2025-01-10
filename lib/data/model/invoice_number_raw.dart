class InvoiceNumberRaw {
  final int? year;
  final int? month;
  final String? specialPrize;
  final String? grandPrize;
  final List<String?> firstPrizeList;

  const InvoiceNumberRaw({
    required this.year,
    required this.month,
    required this.specialPrize,
    required this.grandPrize,
    required this.firstPrizeList,
  });
}
