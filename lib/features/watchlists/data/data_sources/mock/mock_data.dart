import 'package:iouring_trading_app/features/watchlists/data/models/stock.dart';

List<StockModel> mockStocks({
  String? exchange,
  String? searchQuery,
}) {
  // Mock stock data
  final List<StockModel> stocks = [
    StockModel(
      id: 'GOLD26JUL59500CE',
      name: 'GOLD 26JUL 59500 CE',
      exchangeType: 'MCX',
      currentPrice: 298.50,
      previousTradeSessionPrice: 275.00, // Calculated from +23.50 change
      shareHoldByUser: 0,
    ),
    StockModel(
      id: 'ACCELYA',
      name: 'ACCELYA',
      exchangeType: 'NSE',
      currentPrice: 1337.70,
      previousTradeSessionPrice: 1336.65, // Calculated from +1.05 change
      shareHoldByUser: 0,
    ),
    StockModel(
      id: 'ACC',
      name: 'ACC',
      exchangeType: 'BSE',
      currentPrice: 1795.20,
      previousTradeSessionPrice: 1768.00, // Calculated from +27.20 change
      shareHoldByUser: 400,
    ),
    StockModel(
      id: 'ACC',
      name: 'ACC Limited',
      exchangeType: 'NSE',
      currentPrice: 1792.30,
      previousTradeSessionPrice: 1766.90, // Calculated from +25.40 change
      shareHoldByUser: 400,
    ),
    StockModel(
      id: 'RELIANCE',
      name: 'Reliance Industries',
      exchangeType: 'NSE',
      currentPrice: 2452.35,
      previousTradeSessionPrice: 2438.50,
      shareHoldByUser: 20,
    ),
    StockModel(
      id: 'RELIANCE',
      name: 'Reliance Industries',
      exchangeType: 'NSE',
      currentPrice: 2452.35,
      previousTradeSessionPrice: 2438.50,
      shareHoldByUser: 20,
    ),
    StockModel(
      id: 'TCS',
      name: 'Tata Consultancy Services',
      exchangeType: 'BSE',
      currentPrice: 3542.75,
      previousTradeSessionPrice: 3528.60,
    ),
    StockModel(
      id: 'INFY',
      name: 'Infosys',
      exchangeType: 'NSE',
      currentPrice: 1536.20,
      previousTradeSessionPrice: 1529.45,
      shareHoldByUser: 40,
    ),
    StockModel(
      id: 'HDFCBANK',
      name: 'HDFC Bank',
      exchangeType: 'BSE',
      currentPrice: 1664.80,
      previousTradeSessionPrice: 1657.10,
    ),
    StockModel(
      id: 'ICICIBANK',
      name: 'ICICI Bank',
      exchangeType: 'SENSEX',
      currentPrice: 942.65,
      previousTradeSessionPrice: 936.80,
    ),
    StockModel(
      id: 'SBIN',
      name: 'State Bank of India',
      exchangeType: 'NSE',
      currentPrice: 610.40,
      previousTradeSessionPrice: 605.75,
    ),
    StockModel(
      id: 'HINDUNILVR',
      name: 'Hindustan Unilever',
      exchangeType: 'BSE',
      currentPrice: 2719.30,
      previousTradeSessionPrice: 2704.25,
    ),
    StockModel(
      id: 'BHARTIARTL',
      name: 'Bharti Airtel',
      exchangeType: 'SENSEX',
      currentPrice: 855.20,
      previousTradeSessionPrice: 849.15,
    ),
    StockModel(
      id: 'ADANIENT',
      name: 'Adani Enterprises',
      exchangeType: 'NSE',
      currentPrice: 1342.50,
      previousTradeSessionPrice: 1330.90,
    ),
    StockModel(
      id: 'ASIANPAINT',
      name: 'Asian Paints',
      exchangeType: 'BSE',
      currentPrice: 3124.75,
      previousTradeSessionPrice: 3108.50,
    ),
    StockModel(
      id: 'ITC',
      name: 'ITC Limited',
      exchangeType: 'SENSEX',
      currentPrice: 418.20,
      previousTradeSessionPrice: 415.75,
    ),
    StockModel(
      id: 'ONGC',
      name: 'Oil and Natural Gas Corporation',
      exchangeType: 'BSE',
      currentPrice: 160.55,
      previousTradeSessionPrice: 159.75,
    ),
    StockModel(
      id: 'TATAMOTORS',
      name: 'Tata Motors',
      exchangeType: 'NSE',
      currentPrice: 503.90,
      previousTradeSessionPrice: 499.85,
    ),
  ];

  return stocks.where((stock) {
    final matchesExchange = exchange == null || stock.exchangeType == exchange;
    final matchesSearchQuery = searchQuery == null ||
        stock.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
        stock.id.toLowerCase().contains(searchQuery.toLowerCase());
    return matchesExchange && matchesSearchQuery;
  }).toList();
}
