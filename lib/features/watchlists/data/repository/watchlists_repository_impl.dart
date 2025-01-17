import 'package:iouring_trading_app/features/watchlists/data/data_sources/mock/watchlists_service.dart';
import 'package:iouring_trading_app/features/watchlists/data/models/stock.dart';
import 'package:iouring_trading_app/features/watchlists/domain/repository/watchlists_repository.dart';

class WatchListsRepositoryImpl extends WatchListsRepository {
  final WatchListsService _watchListsService;

  WatchListsRepositoryImpl({required WatchListsService watchListsService})
      : _watchListsService = watchListsService;
  @override
  List<StockModel> getWatchLists({String? type, String? searchQuery}) {
    final data = _watchListsService.getWatchLists(
      type: type,
      searchQuery: searchQuery,
    );

    return data;
  }
}
