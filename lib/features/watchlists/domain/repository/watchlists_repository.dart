import 'package:iouring_trading_app/features/watchlists/domain/entities/stock.dart';

abstract class WatchListsRepository {
  List<StockEntity> getWatchLists({String? type, String? searchQuery});
}
