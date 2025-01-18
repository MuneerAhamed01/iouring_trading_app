// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:iouring_trading_app/features/watchlists/domain/entities/stock.dart';
import 'package:iouring_trading_app/features/watchlists/domain/params/get_watchlist_params.dart';
import 'package:iouring_trading_app/features/watchlists/domain/usecases/get_watchlists.dart';

part 'watch_lists_event.dart';
part 'watch_lists_state.dart';

class WatchListsBloc extends Bloc<WatchListsEvent, WatchListsState> {
  final GetWatchListsUseCase _getWatchListsUseCase;

  WatchListsBloc(this._getWatchListsUseCase) : super(WatchListsLoading()) {
    on<GetAllWatchList>(_onAllWatchlistEvent);
    on<GetTypedWatchList>(_onTypedWatchLists);
  }

  _onAllWatchlistEvent(
    GetAllWatchList event,
    Emitter<WatchListsState> emit,
  ) {
    emit(WatchListsLoading(
      allWatchLists: state.allWatchLists,
      niftyWatchLists: state.niftyWatchLists,
      bseWatchLists: state.bseWatchLists,
      sensexWatchLists: state.sensexWatchLists,
    ));
    final data = _getWatchListsUseCase(param: GetWatchListParams());

    emit(WatchListsDone(
      allWatchLists: data,
      niftyWatchLists: state.niftyWatchLists,
      bseWatchLists: state.bseWatchLists,
      sensexWatchLists: state.sensexWatchLists,
    ));
  }

  _onTypedWatchLists(
    GetTypedWatchList event,
    Emitter<WatchListsState> emit,
  ) {
    emit(WatchListsLoading(
      allWatchLists: state.allWatchLists,
      niftyWatchLists: state.niftyWatchLists,
      bseWatchLists: state.bseWatchLists,
      sensexWatchLists: state.sensexWatchLists,
    ));

    final param = GetWatchListParams(exchangeType: event.exchangeType);
    final data = _getWatchListsUseCase(param: param);

    emit(
      WatchListsDone(
        allWatchLists: state.allWatchLists,
        niftyWatchLists:
            event.exchangeType == "NSE" ? data : state.niftyWatchLists,
        bseWatchLists: event.exchangeType == "BSE" ? data : state.bseWatchLists,
        sensexWatchLists:
            event.exchangeType == "SENSEX" ? data : state.sensexWatchLists,
      ),
    );
  }
}
