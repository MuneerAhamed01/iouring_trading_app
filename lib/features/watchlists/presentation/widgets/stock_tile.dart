import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iouring_trading_app/config/theme/colors.dart';
import 'package:iouring_trading_app/core/utils/images.dart';

class StockTile extends StatelessWidget {
  const StockTile({
    super.key,
    required this.stockName,
    required this.stockExchange,
    this.holedStocks,
    required this.currentPrice,
    required this.lastPrice,
  });

  final String stockName;

  final String stockExchange;

  final int? holedStocks;

  final double currentPrice;

  final double lastPrice;

  String get _increasedBy {
    double increase = currentPrice - lastPrice;
    return increase.toStringAsFixed(2);
  }

  String get _percentage {
    double percentageChange = ((currentPrice - lastPrice) / lastPrice) * 100;

    return percentageChange.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stockName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                _buildSubtitle(),
              ],
            ),
          ),

          // Right section (Price and Percentage)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Price section
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.translate(
                    offset: const Offset(0, 1.2),
                    child: Icon(
                      Icons.arrow_drop_up,
                      size: 38,
                      color: MyColors.primary,
                    ),
                  ),
                  Text(
                    currentPrice.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 16,
                      color: MyColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: "+$_increasedBy",
                      style: TextStyle(
                        color: MyColors.iconGrey,
                      ),
                    ),
                    TextSpan(
                      text: " ($_percentage%)",
                      style: TextStyle(
                        color: MyColors.iconGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _buildSubtitle() {
    return Row(
      children: [
        Text(
          stockExchange,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 8),
        if (holedStocks != null && holedStocks != 0) ...[
          SvgPicture.asset(
            kSvgsInactivePortfolio,
            width: 14,
            height: 14,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            holedStocks?.toString() ?? '',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ]
      ],
    );
  }
}
