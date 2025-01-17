part of 'bottomnav_cubit.dart';

abstract class BottomNavState {
  final String currentRoute;

  BottomNavState({required this.currentRoute});
}

class BottomNavInitial extends BottomNavState {
  BottomNavInitial({super.currentRoute = kRouteWatchList});
}

class BottomNavChanged extends BottomNavState {
  BottomNavChanged({required super.currentRoute});
}
