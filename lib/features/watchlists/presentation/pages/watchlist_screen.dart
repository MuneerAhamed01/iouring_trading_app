import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iouring_trading_app/config/theme/colors.dart';
import 'package:iouring_trading_app/core/utils/images.dart';
import 'package:iouring_trading_app/dependency_injection.dart';
import 'package:iouring_trading_app/features/watchlists/presentation/bloc/watchlist_bloc/watch_lists_bloc.dart';
import 'package:iouring_trading_app/features/watchlists/presentation/bloc/watchlist_search_bloc/watchlist_search_bloc.dart';
import 'package:iouring_trading_app/features/watchlists/presentation/pages/watchlist_search.dart';
import 'package:iouring_trading_app/features/watchlists/presentation/widgets/searchfield.dart';
import 'package:iouring_trading_app/features/watchlists/presentation/widgets/stock_tile.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({super.key});

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this)
      ..addListener(_onPageChangeListener);
  }

  void _onPageChangeListener() {
    // USING IT AS STRING WILL ASSUMING MORE TYPES WILL COME
    if (_tabController.indexIsChanging) return;
    if (_tabController.index == 0) {
      context.read<WatchListsBloc>().add(GetAllWatchList());
    } else {
      final exchangeValues = {
        1: "NSE",
        2: "BSE",
        3: "SENSEX",
      }[_tabController.index];
      context
          .read<WatchListsBloc>()
          .add(GetTypedWatchList(type: exchangeValues!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: BlocBuilder<WatchListsBloc, WatchListsState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(height: 10),
                Hero(
                  tag: 'search-watchlist',
                  child: MySearchfield(
                    isDisabled: true,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => BlocProvider<WatchlistSearchBloc>(
                            create: (context) => getIt(),
                            child: WatchlistSearch(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: List.generate(
                      4,
                      (tabIndex) {
                        final watchLists = {
                          0: state.allWatchLists,
                          1: state.niftyWatchLists,
                          2: state.bseWatchLists,
                          3: state.sensexWatchLists,
                        }[tabIndex];
                        if (watchLists == null || watchLists.isEmpty) {
                          return _buildLoading();
                        }
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (_, index) => StockTile(
                                  stockName: watchLists[index].name,
                                  stockExchange: watchLists[index].exchangeType,
                                  currentPrice: watchLists[index].currentPrice,
                                  lastPrice: watchLists[index]
                                      .previousTradeSessionPrice,
                                  holedStocks:
                                      watchLists[index].shareHoldByUser,
                                ),
                                separatorBuilder: (_, __) => Container(
                                  margin: EdgeInsets.only(top: 4),
                                  width: double.infinity,
                                  height: 0.29,
                                  color:
                                      MyColors.iconGrey.withValues(alpha: 0.8),
                                ),
                                itemCount: watchLists.length,
                              ),
                              SizedBox(height: 20),
                              Text(
                                "4 / 50 Stocks",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
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
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  SizedBox _buildLoading() {
    return SizedBox(
      height: 10,
      width: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: MyColors.primary,
          ),
        ],
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
      bottom: _buildBottom(),
    );
  }

  PreferredSize _buildBottom() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: Row(
        children: [
          Expanded(
            child: _buildTabBar(),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8, bottom: 4),
            child: SvgPicture.asset(
              kSvgsMoreGo,
              height: 18,
              width: 18,
              colorFilter: ColorFilter.mode(MyColors.primary, BlendMode.srcIn),
            ),
          )
          // Icon(Icons.list)
        ],
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      controller: _tabController,
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
    );
  }

  Padding _wrapTabConstantPadding(Widget child) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
      child: child,
    );
  }

  @override
  void dispose() {
    _tabController.removeListener(_onPageChangeListener);
    _tabController.dispose();
    super.dispose();
  }
}
