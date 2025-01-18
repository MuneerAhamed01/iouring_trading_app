import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iouring_trading_app/config/theme/colors.dart';
import 'package:iouring_trading_app/core/utils/images.dart';

class MySearchfield extends StatelessWidget {
  const MySearchfield({
    super.key,
    this.controller,
    this.hintText = "Search & Add",
    this.showActions = true,
    this.isDisabled = false,
    this.onTap,
    this.autoFocus = false,
  });

  final TextEditingController? controller;
  final String hintText;
  final bool showActions;
  final VoidCallback? onTap;
  final bool isDisabled;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      autofocus: autoFocus,
      readOnly: isDisabled,
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: MyColors.bottomNavBackground,
        border: _border(),
        enabledBorder: _border(),
        disabledBorder: _border(),
        focusedBorder: _border(),
        prefixIconConstraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
        hintText: hintText,
        hintStyle: TextStyle(fontWeight: FontWeight.bold),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 20, right: 10),
          child: _buildPrefix(),
        ),
        contentPadding: EdgeInsets.only(left: 20, top: 14, bottom: 14),
        suffixIcon: showActions ? _buildSuffix() : null,
      ),
    );
  }

  SvgPicture _buildPrefix() {
    return SvgPicture.asset(
      kSvgsSearch,
      width: 20,
      height: 20,
      colorFilter: ColorFilter.mode(MyColors.iconGrey, BlendMode.srcIn),
    );
  }

  Row _buildSuffix() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 20,
          child: VerticalDivider(
            color: MyColors.iconGrey,
            thickness: 0.5,
          ),
        ),
        SizedBox(width: 5),
        SvgPicture.asset(
          kSvgsMenuBox,
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(
            MyColors.primary,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 20),
        SvgPicture.asset(
          kSvgsFilter,
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(
            MyColors.primary,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 15),
      ],
    );
  }

  OutlineInputBorder _border() =>
      OutlineInputBorder(borderRadius: BorderRadius.circular(8));
}
