import 'package:setup_mvvm_architechture/app/app_localization.dart';
import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:setup_mvvm_architechture/mvvm/model/client_data.dart';
import 'package:setup_mvvm_architechture/ui/theming/colors.dart';
import 'package:setup_mvvm_architechture/ui/theming/text_styles.dart';
import 'package:setup_mvvm_architechture/ui/widgets/dividers.dart';
import 'package:setup_mvvm_architechture/utils/assets_utils.dart';
import 'package:setup_mvvm_architechture/utils/custom_date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClientSearchListItem extends StatefulWidget {
  final ClientData? data;
  final ClientData? selectedClientData;
  bool? isMultiSelectListView;
  bool? isClientGroupList;
  bool? isVisitStarted;
  String? startVisitStatus;
  final onClientSelected;

  ClientSearchListItem(this.data,
      {this.isMultiSelectListView = false,
      this.isClientGroupList = false,
      this.selectedClientData,
      this.isVisitStarted = false,
      this.onClientSelected});

  @override
  _ClientSearchListItemState createState() => _ClientSearchListItemState();
}

class _ClientSearchListItemState extends State<ClientSearchListItem> {
  var selectedClient;
  @override
  Widget build(BuildContext context) {
    return _buildListSearchItem(context);
  }

  Widget _buildListSearchItem(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: colors().inkWellHighlights,
        highlightColor: colors().inkWellHighlights,
        onTap: () {
          if (widget.isMultiSelectListView!) {
            setState(() {
              widget.data!.isSelected = !widget.data!.isSelected!;
            });
          } else {
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                leading: SvgPicture.asset(AssetsUtil.iconUserPlaceholder),
                // leading: CachedNetworkImage(
                //   imageUrl: widget.data!.photo ?? '',
                //   placeholder: (context, url) => CircleAvatar(
                //     radius: 24,
                //     backgroundColor: Colors.transparent,
                //     child: SvgPicture.asset(AssetsUtil.iconUserPlaceholder),
                //   ),
                //   errorWidget: (context, url, error) => CircleAvatar(
                //     radius: 24,
                //     backgroundColor: Colors.transparent,
                //     child: SvgPicture.asset(AssetsUtil.iconUserPlaceholder),
                //   ),
                //   fit: BoxFit.fill,
                //   alignment: Alignment.center,
                //   imageBuilder: (context, imageProvider) => Container(
                //     width: 48.0,
                //     height: 48.0,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       image: DecorationImage(
                //         image: imageProvider,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                // ),
                title: Text(
                  widget.data!.userFullName,
                  style: AppTextStyles.n18fw600(colors().primaryTextColorDark),
                ),
                subtitle: Text(
                  widget.data!.startDateTime == null
                      ? ""
                      : CustomDateUtils.formatAppointmentDate(
                          widget.data!.startDateTime!),
                  style: AppTextStyles.n16(colors().primaryTextColorLight),
                ),
                trailing: this.widget.isMultiSelectListView!
                    ? _showCheckBox()
                    : this.widget.isClientGroupList!
                        ? _showStartVisitStatus()
                        : _getTrailingIcons(context)),
            _buildSubListItem(
                str(context).clientGenderLabel, widget.data!.gender.toString()),
            Delimiter.height(16),
            _buildSubListItem(
                str(context).dateOfBirthLabel,
                widget.data!.dOB == null
                    ? ""
                    : CustomDateUtils.formatDateTime(widget.data!.dOB!)),
            Delimiter.height(16),
            Padding(
              padding: const EdgeInsets.only(
                left: 80,
                right: 16,
              ),
              child: DefaultDivider(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubListItem(String label, String data) => Padding(
        padding: const EdgeInsets.only(
          left: 80,
          right: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              label,
              style: AppTextStyles.n14fw600(colors().primaryTextColorDark),
            ),
            Delimiter.width(4),
            Text(
              data,
              style: AppTextStyles.n14(colors().primaryTextColorLight),
            ),
          ],
        ),
      );

  Widget _getTrailingIcons(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
              onTap: () {
                if (!widget.isClientGroupList! && widget.isVisitStarted!) {
                  print('Please start visit first');
                  return;
                }
                // AppointmentData appointmentData = AppointmentData();
                // appointmentData.clientDetail =
                // new ClientDetail.fromJson1(widget.data.toJson());
                // var args = ClientInfoScreenArgs(data: appointmentData);
                // Navigator.of(context)
                //     .pushNamed(AppRouter.clientInfo, arguments: args);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Icon(
                  Icons.speaker_notes,
                  color: AppColors().primary,
                ),
              )),
          SvgPicture.asset(AssetsUtil.iconArrowNext),
        ],
      );

  Widget _showCheckBox() => Container(
        child: widget.data!.isSelected!
            ? Icon(Icons.check_box)
            : Icon(Icons.check_box_outline_blank),
      );

  Widget _showStartVisitStatus() => InkWell(
        onTap: () {
          if (this.widget.onClientSelected != null)
            this.widget.onClientSelected(widget.data);
        },
        child: widget.startVisitStatus == 'endVisit'
            ? Container(
                child: Icon(Icons.check_box),
              )
            : Container(
                child: this.widget.selectedClientData != null &&
                        this.widget.selectedClientData!.clientID ==
                            widget.data!.clientID
                    ? Icon(Icons.radio_button_checked)
                    : Icon(Icons.radio_button_unchecked),
              ),
      );
}
