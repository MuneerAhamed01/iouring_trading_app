part of 'watchlist_search_bloc.dart';

abstract class WatchlistSearchEvent {
  final String? searchQuery;

  WatchlistSearchEvent({this.searchQuery});
}

class WatchListSearchingEvent extends WatchlistSearchEvent {
  WatchListSearchingEvent({required searchValue})
      : super(searchQuery: searchValue);
}
