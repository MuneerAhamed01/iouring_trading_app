part of 'watch_lists_bloc.dart';

abstract class WatchListsEvent {
  final String? exchangeType;

  const WatchListsEvent({this.exchangeType});
}

class GetAllWatchList extends WatchListsEvent {}

class GetTypedWatchList extends WatchListsEvent {
  final String type;
  GetTypedWatchList({required this.type}) : super(exchangeType: type);
}
