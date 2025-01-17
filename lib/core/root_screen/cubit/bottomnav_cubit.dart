import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iouring_trading_app/config/routes/routes_name.dart';
part 'bottomnav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitial());

  void onChangeRoute(String route) {
    emit(BottomNavChanged(currentRoute: route));
  }
}
