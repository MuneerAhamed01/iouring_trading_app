import 'package:iouring_trading_app/core/usecase/usecase.dart';
import 'package:iouring_trading_app/features/watchlists/domain/entities/stock.dart';
import 'package:iouring_trading_app/features/watchlists/domain/params/get_watchlist_params.dart';
import 'package:iouring_trading_app/features/watchlists/domain/repository/watchlists_repository.dart';

class GetWatchListsUseCase
    implements UseCase<List<StockEntity>, GetWatchListParams> {
  final WatchListsRepository _watchListsRepository;

  GetWatchListsUseCase({required WatchListsRepository watchListsRepository})
      : _watchListsRepository = watchListsRepository;

  @override
  List<StockEntity> call({required GetWatchListParams param}) {
    return _watchListsRepository.getWatchLists(param: param);
  }
}
