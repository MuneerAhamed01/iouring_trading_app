import 'package:iouring_trading_app/features/watchlists/data/models/stock.dart';

abstract class WatchListsService {
  List<StockModel> getWatchLists({String? type, String? searchQuery}) {
    return [];
  }
}
