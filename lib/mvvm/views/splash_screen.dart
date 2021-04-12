import 'dart:async';

import 'package:setup_mvvm_architechture/app/app_router.dart';
import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:setup_mvvm_architechture/ui/theming/text_styles.dart';
import 'package:setup_mvvm_architechture/utils/assets_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

import 'package:flutter/widgets.dart';

import 'package:intl/intl.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with AfterLayoutMixin<SplashScreen>, WidgetsBindingObserver {
  Timer? _timer;
  bool _isReadyToLaunch = false;
  bool _isReadyTimer = false;
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    initSettings();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        color: colors().primary,
        child: Column(
          //mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text('Splash Screen',style: AppTextStyles.n24(Colors.white),))
          ],
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    _timer = Timer(
      Duration(seconds: 2),
      () {
        _isReadyTimer = true;
        _navNext();
      },
    );
  }

  void initSettings() async {
    String startVisitTime = DateFormat('yyyy-MM-ddTHH:mm:aa')
        .format(DateTime.now().toUtc())
        .toString();
    print(startVisitTime);
    try {
      connectionService().init();
      _isReadyToLaunch = true;
      _navNext();
    } catch (e) {
      _isReadyToLaunch = true;
      _navNext();
    }
  }

  void _navNext() {
    if (_isReadyToLaunch && _isReadyTimer) {
      _timer?.cancel();
      print("*******has connection === ${connectionService().hasConnection}");
      print('isReady to launc');
      Navigator.of(context).pushReplacementNamed(AppRouter.loginScreen);
    }
  }
}
