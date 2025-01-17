import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iouring_trading_app/core/root_screen/cubit/bottomnav_cubit.dart';
import 'package:iouring_trading_app/core/root_screen/widgets/bottom_nav_bar.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BlocConsumer<BottomNavCubit, BottomNavState>(
        listener: _onBottomNavListen,
        builder: (context, state) {
          return MyBottomNavBar(
            activeRoute: state.currentRoute,
            onTap: (route) {
              context.read<BottomNavCubit>().onChangeRoute(route);
            },
          );
        },
      ),
    );
  }

  void _onBottomNavListen(BuildContext context, BottomNavState state) {
    context.go(state.currentRoute);
  }
}
