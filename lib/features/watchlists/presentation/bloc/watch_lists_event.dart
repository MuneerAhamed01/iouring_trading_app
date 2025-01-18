part of 'watch_lists_bloc.dart';

abstract class WatchListsEvent {
  final String? exchangeType;

  const WatchListsEvent({this.exchangeType});
}

class GetAllWatchList extends WatchListsEvent {}

class GetNiftyWatchList extends WatchListsEvent {
  GetNiftyWatchList({super.exchangeType = "NSE"});
}

class GetBSEWatchList extends WatchListsEvent {
  GetBSEWatchList({super.exchangeType = "BSE"});
}

class GetSenSexWatchList extends WatchListsEvent {
  GetSenSexWatchList({super.exchangeType = "SENSEX"});
}
