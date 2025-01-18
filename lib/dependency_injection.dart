import 'package:get_it/get_it.dart';
import 'package:iouring_trading_app/features/watchlists/data/data_sources/mock/watchlists_service.dart';
import 'package:iouring_trading_app/features/watchlists/data/repository/watchlists_repository_impl.dart';
import 'package:iouring_trading_app/features/watchlists/domain/repository/watchlists_repository.dart';
import 'package:iouring_trading_app/features/watchlists/domain/usecases/get_watchlists.dart';
import 'package:iouring_trading_app/features/watchlists/presentation/bloc/watch_lists_bloc.dart';

final getIt = GetIt.instance;

Future<void> injectDependencies() async {
  getIt.registerSingleton(WatchListsService());

  getIt.registerSingleton<WatchListsRepository>(
    WatchListsRepositoryImpl(watchListsService: getIt()),
  );

  getIt.registerSingleton<GetWatchListsUseCase>(
    GetWatchListsUseCase(
      watchListsRepository: getIt(),
    ),
  );

  getIt.registerFactory(() => WatchListsBloc(getIt()));
}
