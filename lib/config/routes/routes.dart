import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iouring_trading_app/config/routes/routes_name.dart';
import 'package:iouring_trading_app/core/root_screen/cubit/bottomnav_cubit.dart';
import 'package:iouring_trading_app/core/root_screen/screens/root_screen.dart';
import 'package:iouring_trading_app/dependency_injection.dart';
import 'package:iouring_trading_app/features/watchlists/presentation/bloc/watchlist_bloc/watch_lists_bloc.dart';
import 'package:iouring_trading_app/features/watchlists/presentation/bloc/watchlist_search_bloc/watchlist_search_bloc.dart';
import 'package:iouring_trading_app/features/watchlists/presentation/pages/watchlist_screen.dart';
import 'package:iouring_trading_app/features/watchlists/presentation/pages/watchlist_search.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

CustomTransitionPage<void> _buildTransitionPage({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration(milliseconds: 100),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
        child: child,
      );
    },
  );
}

final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: kRouteWatchList,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => BlocProvider(
        create: (context) => BottomNavCubit(),
        child: RootScreen(child: child),
      ),
      routes: [
        GoRoute(
          path: kRouteWatchList,
          pageBuilder: (context, state) => _buildTransitionPage(
            context: context,
            state: state,
            child: BlocProvider<WatchListsBloc>(
              create: (context) => getIt()..add(GetAllWatchList()),
              child: WatchListPage(),
            ),
          ),
        ),
        GoRoute(
          path: kRouteOrders,
          pageBuilder: (context, state) => _buildTransitionPage(
            context: context,
            state: state,
            child: Center(
              child: Text(
                'Orders',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        GoRoute(
          path: kRoutePortfolio,
          pageBuilder: (context, state) => _buildTransitionPage(
            context: context,
            state: state,
            child: Center(
              child: Text(
                'Portolio',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        GoRoute(
          path: kRouteMovers,
          pageBuilder: (context, state) => _buildTransitionPage(
            context: context,
            state: state,
            child: Center(
                child: Text(
              'Movers',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
        GoRoute(
          path: kRouteMore,
          pageBuilder: (context, state) => _buildTransitionPage(
            context: context,
            state: state,
            child: Center(
                child: Text(
              'More',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
      ],
    ),
    GoRoute(
      path: kRouteWatchListSearch,
      pageBuilder: (context, __) => MaterialPage(
        child: BlocProvider<WatchlistSearchBloc>(
          create: (context) => getIt(),
          child: WatchlistSearch(),
        ),
      ),
    ),
  ],
);
