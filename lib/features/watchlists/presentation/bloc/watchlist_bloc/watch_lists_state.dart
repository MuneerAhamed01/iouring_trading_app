part of 'watch_lists_bloc.dart';

abstract class WatchListsState {
  final List<StockEntity>? allWatchLists;
  final List<StockEntity>? niftyWatchLists;
  final List<StockEntity>? bseWatchLists;
  final List<StockEntity>? sensexWatchLists;

  WatchListsState({
    this.allWatchLists,
    this.niftyWatchLists,
    this.bseWatchLists,
    this.sensexWatchLists,
  });
}

class WatchListsLoading extends WatchListsState {
  WatchListsLoading({
    super.allWatchLists,
    super.niftyWatchLists,
    super.bseWatchLists,
    super.sensexWatchLists,
  });
}

class WatchListsDone extends WatchListsState {
  WatchListsDone({
    super.allWatchLists,
    super.niftyWatchLists,
    super.bseWatchLists,
    super.sensexWatchLists,
  });
}
