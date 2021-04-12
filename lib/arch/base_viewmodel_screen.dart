import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:flutter/widgets.dart';

import 'base_view_model.dart';

abstract class BaseViewModelScreenState<T extends StatefulWidget,
    V extends BaseViewModel> extends State<T> {
  V? viewModel;

  bool isOffline = false;

  @override
  void initState() {
    super.initState();
    viewModel = setViewModel();
    setStreamSubscribers();
    viewModel!.errorStream.listen(onError);
    connectionService().connectionChange.listen(_connectionChanged);
    if (mounted) {
      WidgetsBinding.instance!.addPostFrameCallback(
        (_) => setState(() {
          isOffline = !connectionService().hasConnection;
        }),
      );
    }
  }

  V setViewModel();

  void setStreamSubscribers();

  void onError(Exception e);

  @override
  void dispose() {
    super.dispose();
    viewModel?.dispose();
  }

  void _connectionChanged(dynamic hasConnection) {
    if (mounted) {
      if (hasConnection) {
        print('***connected == true');
        connectionService().tryToSendNotSendVisitData(context);
        connectionService().saveFormData(context);
        connectionService().saveClientGroupEVVData(context);
        connectionService().saveClientGroup(context);
      }
      setState(() {
        isOffline = !hasConnection;
        if (isOffline) {
          // dialogService().showConnectionErrorDialog(context: context);
        }
      });
    }
  }
}
