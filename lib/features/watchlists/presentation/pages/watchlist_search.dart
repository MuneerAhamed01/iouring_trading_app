import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iouring_trading_app/config/theme/colors.dart';
import 'package:iouring_trading_app/features/watchlists/presentation/bloc/watchlist_search_bloc/watchlist_search_bloc.dart';
import 'package:iouring_trading_app/features/watchlists/presentation/widgets/searchfield.dart';
import 'package:iouring_trading_app/features/watchlists/presentation/widgets/stock_tile.dart';

class WatchlistSearch extends StatefulWidget {
  const WatchlistSearch({super.key});

  @override
  State<WatchlistSearch> createState() => _WatchlistSearchState();
}

class _WatchlistSearchState extends State<WatchlistSearch> {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController()..addListener(_changeListener);
  }

  void _changeListener() {
    context
        .read<WatchlistSearchBloc>()
        .add(WatchListSearchingEvent(searchValue: _textController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: BlocBuilder<WatchlistSearchBloc, WatchlistSearchState>(
          builder: (context, state) {
            if (state.searchedStocks == null) {
              String message;
              if (_textController.text.isEmpty) {
                message = 'Search stocks from your watchlist';
              } else {
                message = "Searched Stock is not available";
              }
              return Center(
                child: Text(
                  message,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              );
            }

            return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, index) => StockTile(
                stockName: state.searchedStocks![index].name,
                stockExchange: state.searchedStocks![index].exchangeType,
                currentPrice: 100,
                lastPrice: 100,
                // holedStocks: 40,
              ),
              separatorBuilder: (_, __) => Container(
                margin: EdgeInsets.only(top: 4),
                width: double.infinity,
                height: 0.29,
                color: MyColors.iconGrey.withValues(alpha: 0.8),
              ),
              itemCount: state.searchedStocks!.length,
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: MyColors.scaffoldBackground,
      centerTitle: false,
      title: Text(
        'Search WatchList',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Hero(
            tag: 'search-watchlist',
            child: MySearchfield(
              controller: _textController,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.removeListener(_changeListener);
    _textController.dispose();
    super.dispose();
  }
}
