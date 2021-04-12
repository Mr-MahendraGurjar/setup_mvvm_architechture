import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:setup_mvvm_architechture/ui/theming/text_styles.dart';
import 'package:setup_mvvm_architechture/ui/theming/ui_const.dart';
import 'package:setup_mvvm_architechture/ui/widgets/dividers.dart';
import 'package:setup_mvvm_architechture/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_widgets/app_icon_buttons.dart';

class AppActionBar extends StatelessWidget implements PreferredSizeWidget {
  static final double _actionBarHeight = UiConst.kActionBarHeight;
  Color _actionBarBgColor = colors().white;
  Color _actionBarTitleColor = colors().primaryTextColorDark;
  final double _horizontalPadding = 14.0;

  Widget? leftChild;
  Widget? rightChild;
  Widget? titleChild;

  Widget? buildContent;

  AppActionBar._();

  AppActionBar.main({
    @required String? title,
    @required VoidCallback? onLeftPressed,
    @required bool? showRightIcon,
  }) {
    titleChild = _buildTitleText(title!);
    leftChild = _buildBackButton(onLeftPressed!);
    rightChild = showRightIcon! ? _buildRightIcon() : SizedBox();
    buildContent = _buildContent();
  }

  AppActionBar.mainlistDefault({
    @required String? title,
    @required VoidCallback? onLeftPressed,
    @required bool? showRightIcon,
    @required VoidCallback? onRightPressed,
  }) {
    titleChild = _buildTitleTextMain(title!);
    leftChild = _buildLeftIcon(
      onLeftPressed!,
    );
    rightChild = showRightIcon! ? _buildRightIcon() : SizedBox();
    buildContent = _buildContentMain(onRightPressed);
  }

  AppActionBar.listDefault({
    required String title,
    required bool showRightIcon,
    required VoidCallback onRightPressed,
  }) {
    titleChild = _buildTitleLeftChild(title);
    leftChild = _buildEmpty();
    rightChild = showRightIcon ? _buildRightIcon() : SizedBox();
    buildContent = _buildDefaultContent(onRightPressed);
  }

  static double getHeight() => _actionBarHeight;

  @override
  Widget build(BuildContext context) => buildContent!;

  Widget _buildDefaultContent(VoidCallback onRightPressed) => Container(
        height: getHeight(),
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: titleChild!,
            ),
            SizedBox(
              width: _actionBarHeight,
              height: _actionBarHeight,
              child: Padding(
                padding: EdgeInsets.all(_horizontalPadding),
                child: rightChild,
              ),
            ),
            IconBtn(
              SvgPicture.asset(AssetsUtil.iconLogout),
              onRightPressed,
            ),
            Delimiter.width(8),
          ],
        ),
      );

  Widget _buildTitleLeftChild(String title) => FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            (title == null) ? '   ' : title,
            style: AppTextStyles.n24fw600(_actionBarTitleColor),
          ),
        ),
      );

  Widget _buildContent() => Container(
        height: getHeight(),
        color: _actionBarBgColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              width: _actionBarHeight,
              height: _actionBarHeight,
              child: Padding(
                padding: EdgeInsets.all(_horizontalPadding),
                child: leftChild,
              ),
            ),
            Expanded(
              child: titleChild!,
            ),
            SizedBox(
              width: _actionBarHeight,
              height: _actionBarHeight,
              child: Padding(
                padding: EdgeInsets.all(_horizontalPadding),
                child: rightChild,
              ),
            ),
          ],
        ),
      );

  Widget _buildContentMain(onRightPressed) => Container(
        height: getHeight(),
        color: _actionBarBgColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              width: _actionBarHeight,
              height: _actionBarHeight,
              child: Padding(
                padding: EdgeInsets.all(_horizontalPadding),
                child: leftChild,
              ),
            ),
            Expanded(
              child: titleChild!,
            ),
            SizedBox(
              width: _actionBarHeight,
              height: _actionBarHeight,
              child: Padding(
                padding: EdgeInsets.all(_horizontalPadding),
                child: rightChild,
              ),
            ),
            // IconBtn(
            //   SvgPicture.asset(AssetsUtil.iconLogout),
            //   onRightPressed,
            // ),
            Delimiter.width(8),
          ],
        ),
      );

  Widget _buildTitleText(String title) => FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: Text(
          (title == null || title.isEmpty) ? '   ' : title,
          style: AppTextStyles.n18(_actionBarTitleColor),
        ),
      );

  Widget _buildTitleTextMain(String title) => FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            (title == null) ? '   ' : title,
            style: AppTextStyles.n24fw600(_actionBarTitleColor),
          ),
        ),
      );

  Widget _buildBackButton(VoidCallback onPressed) => FittedBox(
      fit: BoxFit.contain,
      alignment: Alignment.center,
      child: IconButtonBack(onPressed));

  Widget _buildRightIcon() => FittedBox(
        fit: BoxFit.contain,
        alignment: Alignment.center,
        child: Container(
          width: 40,
          height: 40,
          child: Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: SvgPicture.asset(
                AssetsUtil.iconNoEth,
                color: colors().ethErrorColor,
              ),
            ),
          ),
        ),
      );

  Widget _buildLeftIcon(VoidCallback onPressed) => FittedBox(
        fit: BoxFit.contain,
        alignment: Alignment.center,
        child: Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.red), // set your color here
              onPressed: () {
                onPressed();
              },
            ),
          ),
        ),
      );

  @override
  Size get preferredSize => Size.fromHeight(getHeight());

  Widget _buildEmpty() => SizedBox(
        height: _actionBarHeight / 2,
        width: _actionBarHeight / 2,
      );
}
