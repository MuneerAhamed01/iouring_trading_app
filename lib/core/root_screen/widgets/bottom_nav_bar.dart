import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iouring_trading_app/config/routes/routes_name.dart';
import 'package:iouring_trading_app/config/theme/colors.dart';
import 'package:iouring_trading_app/core/utils/images.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    super.key,
    required this.activeRoute,
    required this.onTap,
  });

  final String activeRoute;

  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    final activeIndex =
        _items.indexWhere((e) => (e.key as ValueKey).value == activeRoute);
    return BottomNavigationBar(
      currentIndex: activeIndex,
      onTap: (index) => onTap((_items[index].key as ValueKey).value),
      backgroundColor: MyColors.bottomNavBackground,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        height: 2,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        height: 2,
      ),
      items: _items,
    );
  }

  List<BottomNavigationBarItem> get _items {
    return [
      BottomNavigationBarItem(
        key: ValueKey(kRouteWatchList),
        activeIcon: Padding(
          padding: EdgeInsets.only(top: 3),
          child: SvgPicture.asset(
            kSvgsActiveHome,
            height: 28,
            width: 28,
          ),
        ),
        icon: Padding(
          padding: EdgeInsets.only(top: 3),
          child: SvgPicture.asset(
            kSvgsInactiveHome,
            height: 28,
            width: 28,
          ),
        ),
        label: 'Watchlist',
      ),
      BottomNavigationBarItem(
        key: ValueKey(kRouteOrders),
        activeIcon: Icon(
          Icons.shopping_bag,
          size: 32,
          color: MyColors.primary,
        ),
        icon: Icon(
          Icons.shopping_bag_outlined,
          size: 32,
          color: MyColors.iconGrey,
        ),
        label: 'Orders',
      ),
      BottomNavigationBarItem(
        key: ValueKey(kRoutePortfolio),
        icon: SvgPicture.asset(
          kSvgsInactivePortfolio,
          height: 28,
          width: 28,
          colorFilter: ColorFilter.mode(
            MyColors.iconGrey,
            BlendMode.srcIn,
          ),
        ),
        activeIcon: SvgPicture.asset(
          kSvgsActivePortfolio,
          height: 28,
          width: 28,
        ),
        label: 'Portfolio',
      ),
      BottomNavigationBarItem(
        key: ValueKey(kRouteMovers),
        icon: SvgPicture.asset(
          kSvgsInactiveMovers,
          height: 28,
          width: 28,
          colorFilter: ColorFilter.mode(
            MyColors.iconGrey,
            BlendMode.srcIn,
          ),
        ),
        activeIcon: SvgPicture.asset(
          kSvgsActiveMovers,
          height: 28,
          width: 28,
        ),
        label: 'Movers',
      ),
      BottomNavigationBarItem(
        key: ValueKey(kRouteMore),
        icon: SvgPicture.asset(
          kSvgsInactiveMore,
          height: 28,
          width: 28,
          colorFilter: ColorFilter.mode(
            MyColors.iconGrey,
            BlendMode.srcIn,
          ),
        ),
        activeIcon: SvgPicture.asset(
          kSvgsActiveMore,
          height: 28,
          width: 28,
        ),
        label: 'More',
      ),
    ];
  }
}
