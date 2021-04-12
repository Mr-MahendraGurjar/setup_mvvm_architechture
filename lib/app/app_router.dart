import 'package:setup_mvvm_architechture/mvvm/views/dashboard_screen.dart';
import 'package:setup_mvvm_architechture/mvvm/views/login_screen.dart';
import 'package:setup_mvvm_architechture/mvvm/views/splash_screen.dart';
import 'package:setup_mvvm_architechture/ui/widgets/helper/dialog_helper.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  AppRouter._();

  static const String home = '/';
  static const String loginScreen = '/LoginScreen';
  static const String dashboardScreen = '/DashBoardScreen';

  static PageRoute? onGenerateRoute(
    RouteSettings settings,
    BuildContext context,
  ) {
    final routes = <String, WidgetBuilder>{
      home: (BuildContext context) => SplashScreen(),
      loginScreen: (BuildContext context) => LoginScreen(),
      dashboardScreen: (BuildContext context) => DashboardScreen(),

    };

    var routBuilder = routes[settings.name];
    if (routBuilder == null) {
      return null;
    }

    return PageTransition(
      child: DialogHelper(
        child: routes[settings.name]!(context),
      ),
      type: PageTransitionType.rightToLeft,
      settings: settings,
    );
  }
}
