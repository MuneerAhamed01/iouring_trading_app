part of 'watchlist_search_bloc.dart';

abstract class WatchlistSearchState {
  final List<StockEntity>? searchedStocks;

  WatchlistSearchState({this.searchedStocks});
}

class WatchlistSearchInitial extends WatchlistSearchState {}

class WatchlistSearchDone extends WatchlistSearchState {
  WatchlistSearchDone({required List<StockEntity> stocks})
      : super(searchedStocks: stocks);
}
