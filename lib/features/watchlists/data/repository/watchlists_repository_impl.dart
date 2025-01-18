import 'package:iouring_trading_app/features/watchlists/data/data_sources/mock/watchlists_service.dart';
import 'package:iouring_trading_app/features/watchlists/domain/entities/stock.dart';
import 'package:iouring_trading_app/features/watchlists/domain/params/get_watchlist_params.dart';
import 'package:iouring_trading_app/features/watchlists/domain/repository/watchlists_repository.dart';

class WatchListsRepositoryImpl extends WatchListsRepository {
  final WatchListsService _watchListsService;

  WatchListsRepositoryImpl({required WatchListsService watchListsService})
      : _watchListsService = watchListsService;

  @override
  List<StockEntity> getWatchLists({required GetWatchListParams param}) {
    final data = _watchListsService.getWatchLists(
      type: param.exchangeType,
      searchQuery: param.searchQuery,
    );

    return data;
  }
}
