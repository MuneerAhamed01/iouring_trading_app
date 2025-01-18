import 'package:iouring_trading_app/features/watchlists/data/data_sources/mock/mock_data.dart';
import 'package:iouring_trading_app/features/watchlists/data/models/stock.dart';

class WatchListsService {
  List<StockModel> getWatchLists({String? type, String? searchQuery}) {
    return mockStocks(exchange: type, searchQuery: searchQuery);
  }
}
