import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iouring_trading_app/features/watchlists/domain/entities/stock.dart';
import 'package:iouring_trading_app/features/watchlists/domain/params/get_watchlist_params.dart';
import 'package:iouring_trading_app/features/watchlists/domain/usecases/get_watchlists.dart';
part 'watchlist_search_event.dart';
part 'watchlist_search_state.dart';

class WatchlistSearchBloc
    extends Bloc<WatchlistSearchEvent, WatchlistSearchState> {
  final GetWatchListsUseCase _getWatchListsUseCase;

  WatchlistSearchBloc(this._getWatchListsUseCase)
      : super(WatchlistSearchInitial()) {
    on<WatchListSearchingEvent>(_onSearch);
  }

  _onSearch(
    WatchListSearchingEvent event,
    Emitter<WatchlistSearchState> emit,
  ) {
    final param = GetWatchListParams(searchQuery: event.searchQuery);
    final data = _getWatchListsUseCase(param: param);
    emit(WatchlistSearchDone(stocks: data));
  }
}
