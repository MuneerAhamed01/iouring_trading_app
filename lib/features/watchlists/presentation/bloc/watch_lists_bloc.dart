import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iouring_trading_app/features/watchlists/domain/entities/stock.dart';

part 'watch_lists_event.dart';
part 'watch_lists_state.dart';

class WatchListsBloc extends Bloc<WatchListsEvent, WatchListsState> {
  WatchListsBloc() : super(WatchListsLoading()) {
    on<WatchListsEvent>((event, emit) {});
  }
}
