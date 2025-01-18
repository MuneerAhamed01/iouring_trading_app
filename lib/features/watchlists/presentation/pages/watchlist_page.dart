import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iouring_trading_app/config/theme/colors.dart';
import 'package:iouring_trading_app/core/utils/images.dart';
import 'package:iouring_trading_app/features/watchlists/presentation/widgets/searchfield.dart';
import 'package:iouring_trading_app/features/watchlists/presentation/widgets/stock_tile.dart';

class WatchListPage extends StatelessWidget {
  const WatchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10),
              MySearchfield(),
              StockTile(
                stockName: "MRF",
                stockExchange: "NSE",
                currentPrice: 299.46,
                lastPrice: 100.20,
                holedStocks: 40,
              ),
              SizedBox(height: 10),
              Text(
                "4 / 50 Stocks",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(
                  kSvgsEdit,
                  height: 20,
                  width: 20,
                  colorFilter: ColorFilter.mode(
                    MyColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
                label: Text(
                  'Edit Watchlist',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: MyColors.scaffoldBackground,
      elevation: 0.3,
      shadowColor: Colors.white.withValues(alpha: 5),
      centerTitle: false,
      title: Text(
        'Watchlist',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
        ),
      ),
      actions: [
        Transform.rotate(
          angle: -0.2,
          child: SvgPicture.asset(
            kSvgsPinPoint,
            width: 25,
            height: 25,
          ),
        ),
        SizedBox(width: 10),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          padding: EdgeInsets.only(right: 90),
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          unselectedLabelColor: Colors.white,
          labelColor: MyColors.primary,
          tabs: [
            _wrapTabConstantPadding(Text('2')),
            _wrapTabConstantPadding(Text('NIFTY')),
            _wrapTabConstantPadding(Text('BANKNIFTY')),
            _wrapTabConstantPadding(Text('SENSEX'))
          ],
        ),
      ),
    );
  }

  Padding _wrapTabConstantPadding(Widget child) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
      child: child,
    );
  }
}
