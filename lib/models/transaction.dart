class Transaction {
  final double amount;
  final String title;
  final String source;
  final bool isIncome;
  final String imageUrl;

  Transaction({
    required this.amount,
    required this.title,
    required this.source,
    required this.isIncome,
    required this.imageUrl,
  });
}
