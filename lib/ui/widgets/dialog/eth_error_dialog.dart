import 'package:setup_mvvm_architechture/app/app_localization.dart';
import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:setup_mvvm_architechture/services/dialog_service.dart';
import 'package:setup_mvvm_architechture/ui/theming/text_styles.dart';
import 'package:setup_mvvm_architechture/ui/theming/ui_const.dart';
import 'package:setup_mvvm_architechture/ui/widgets/app_button.dart';
import 'package:setup_mvvm_architechture/ui/widgets/dialog/custom_dialog_rounded_wiget.dart';
import 'package:setup_mvvm_architechture/ui/widgets/dividers.dart';
import 'package:setup_mvvm_architechture/utils/assets_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EthErrorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomDialogRoundedWidget(
      Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: AlignmentDirectional.topCenter,
        child: SizedBox(
          width: 80,
          height: 80,
          child: SvgPicture.asset(AssetsUtil.iconNoEthDialog),
        ),
      ),
      _connectionErrorBottomWidget(context),
      305,
      1.6,
    );
  }

  Widget _connectionErrorBottomWidget(BuildContext context) => Column(
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
                    str(context).offlineDialogTitle,
                    style:
                        AppTextStyles.n18fw600(colors().primaryTextColorDark),
                  ),
                ),
                Delimiter.height(16),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    str(context).offlineDialogMessage,
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
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 24, top: 16),
                child: AppButton.dark(
                  title: str(context).okDialogPositive,
                  onPressed: () {
                    dialogService().dialogComplete(
                      DialogResponse(action: DialogAction.ACTION_POSITIVE),
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
