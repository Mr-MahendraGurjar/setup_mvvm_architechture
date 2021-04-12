import 'package:setup_mvvm_architechture/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDialogRoundedWidget extends StatelessWidget {
  final Widget childRoundContent;
  final Widget childMainContent;
  final double maxDialogHeight;
  final double heightRatio;

  CustomDialogRoundedWidget(
    this.childMainContent,
    this.childRoundContent,
    this.maxDialogHeight,
    this.heightRatio,
  );

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: maxDialogHeight,
        child: Stack(
          children: <Widget>[
            _buildGradientBg(context),
            childMainContent,
            _buildRoundedContainer(context),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientBg(BuildContext context) => Container(
        margin: EdgeInsets.only(bottom: maxDialogHeight / 8),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsUtil.gradientBackground),
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget _buildRoundedContainer(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(24.0),
                topRight: const Radius.circular(24.0),
              ),
            ),
            child: SizedBox(
              height: maxDialogHeight / heightRatio,
              width: double.infinity,
              child: childRoundContent,
            ),
          ),
        ],
      );
}
