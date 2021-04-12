import 'package:setup_mvvm_architechture/app/app_localization.dart';
import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:setup_mvvm_architechture/services/dialog_service.dart';
import 'package:setup_mvvm_architechture/ui/theming/text_styles.dart';
import 'package:setup_mvvm_architechture/ui/theming/ui_const.dart';
import 'package:setup_mvvm_architechture/ui/widgets/dialog/custom_dialog_rounded_wiget.dart';
import 'package:setup_mvvm_architechture/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_button.dart';
import '../dividers.dart';

class LogoutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomDialogRoundedWidget(
      Container(
        padding: EdgeInsets.only(top: 36, left: 10),
        alignment: AlignmentDirectional.topCenter,
        child: SizedBox(
          width: 60,
          height: 60,
          child: SvgPicture.asset(AssetsUtil.iconLogoutBig),
        ),
      ),
      _bottomChild(context),
      345,
      1.55,
    );
  }

  Widget _bottomChild(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 18,
              right: UiConst.kPagePadding16,
              left: UiConst.kPagePadding16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    str(context).logOutDialogTitle,
                    style:
                        AppTextStyles.n18fw600(colors().primaryTextColorDark),
                  ),
                ),
                Delimiter.height(16),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    str(context).logOutDialogMessage,
                    style: AppTextStyles.n16(colors().primaryTextColor),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: UiConst.kPagePadding16,
                ),
                child: AppButton.dark(
                  title: str(context).okDialog,
                  onPressed: () {
                    dialogService().dialogComplete(
                      DialogResponse(action: DialogAction.ACTION_POSITIVE),
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: UiConst.kPagePadding16,
                    right: UiConst.kPagePadding16,
                    bottom: UiConst.kPagePadding24,
                    top: 8),
                child: AppButton.light(
                  title: str(context).noDialog,
                  onPressed: () async {
                    dialogService().dialogComplete(
                      DialogResponse(action: DialogAction.ACTION_NEGATIVE),
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      );
}
