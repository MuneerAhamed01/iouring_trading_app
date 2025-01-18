class StockEntity {
  final String id;
  final String name;
  final String exchangeType;
  final double currentPrice;
  final double previousTradeSessionPrice;
  final int? shareHoldByUser;

  StockEntity({
    required this.id,
    required this.name,
    required this.exchangeType,
    required this.currentPrice,
    required this.previousTradeSessionPrice,
    this.shareHoldByUser,
  });
}
