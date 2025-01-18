import 'package:iouring_trading_app/features/watchlists/domain/entities/stock.dart';
import 'package:iouring_trading_app/features/watchlists/domain/params/get_watchlist_params.dart';

abstract class WatchListsRepository {
  List<StockEntity> getWatchLists({required GetWatchListParams param});
}
