import 'package:iouring_trading_app/features/watchlists/domain/entities/stock.dart';

class StockModel extends StockEntity {
  StockModel({
    required super.id,
    required super.name,
    required super.exchangeType,
    required super.currentPrice,
    required super.previousTradeSessionPrice,
    super.shareHoldByUser,
  });

  /// NOT USED
  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      id: json['id'] as String,
      name: json['name'] as String,
      exchangeType: json['exchangeType'] as String,
      currentPrice: json['currentPrice'] as double,
      previousTradeSessionPrice: json['previousTradeSessionPrice'] as double,
      shareHoldByUser: json['shareHoldByUser'] as int?,
    );
  }

  /// NOT USED
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'exchangeType': exchangeType,
      'currentPrice': currentPrice,
      'previousTradeSessionPrice': previousTradeSessionPrice,
      "shareHoldByUser": shareHoldByUser,
    };
  }
}
