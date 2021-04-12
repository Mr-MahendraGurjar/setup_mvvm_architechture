import 'package:after_layout/after_layout.dart';
import 'package:setup_mvvm_architechture/app/app_localization.dart';
import 'package:setup_mvvm_architechture/app/app_router.dart';
import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:setup_mvvm_architechture/arch/base_viewmodel_screen.dart';
import 'package:setup_mvvm_architechture/arch/logger.dart';
import 'package:setup_mvvm_architechture/mvvm/viewmodel/login_view_model.dart';
import 'package:setup_mvvm_architechture/ui/theming/decorations.dart';
import 'package:setup_mvvm_architechture/ui/theming/text_styles.dart';
import 'package:setup_mvvm_architechture/ui/theming/ui_const.dart';
import 'package:setup_mvvm_architechture/ui/widgets/app_button.dart';
import 'package:setup_mvvm_architechture/ui/widgets/common/keyboard_closable.dart';
import 'package:setup_mvvm_architechture/ui/widgets/common/scroll_root_min.dart';
import 'package:setup_mvvm_architechture/ui/widgets/dividers.dart';
import 'package:setup_mvvm_architechture/ui/widgets/ensure_visible.dart.dart';
import 'package:setup_mvvm_architechture/utils/assets_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState
    extends BaseViewModelScreenState<LoginScreen, LoginViewModel>
    with AfterLayoutMixin<LoginScreen>, WidgetsBindingObserver {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _companyCodeFocus = FocusNode();
  final FocusNode _userNameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  bool _userError = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    // viewModel.onBioMetricalAuth(context);
    // await dialogService().showProgressDialog(context);
    // _checkAppUpdate();
  }

  @override
  void setStreamSubscribers() {
    viewModel?.loginStream.listen(_onLoginResult);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  LoginViewModel setViewModel() => LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: KeyboardClosable(
          child: ScrollRootMin(
            child: Center(
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: UiConst.kPagePadding16),
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Delimiter.height(80),
                    Image.asset(
                      AssetsUtil.imgLogoPink,
                      height: 48,
                      width: 210,
                    ),
                    Delimiter.height(72),
                    _buildFormContent(),
                    // Delimiter.height(16),
                    // _buildRememberMeContent(),
                    Delimiter.height(14),
                    _buildLoginButton(context),
                    Delimiter.height(21),
                    _buildBlockedErrorText(context, _userError),
                    // Delimiter.height(10),
                    // Container(
                    //   child: Text("Version 1.5(3) (Production)",
                    //       style: TextStyle(decoration: TextDecoration.underline)),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormContent() => Form(
        key: _formKey,
        autovalidate: false,
        child: Column(
          children: <Widget>[
            EnsureVisibleWhenFocused(
              focusNode: _companyCodeFocus,
              child: _buildThemedFormField(
                child: TextFormField(
                  controller: viewModel!.codeController,
                  focusNode: _companyCodeFocus,
                  decoration: DefaultInputDecoration(
                    labelText: str(context).companyCodeHint,
                  ),
                  keyboardType: TextInputType.text,
                  style: AppTextStyles.n18(
                    colors().editTextColor,
                  ),
                  validator: (value) =>
                      viewModel!.codeValidator!.asValidator(context, value),
                  onSaved: (value) => viewModel!.companyCode = value!.trim(),
                  textInputAction: TextInputAction.go,
                  onFieldSubmitted: (value) =>
                      FocusScope.of(context).requestFocus(_userNameFocus),
                ),
              ),
            ),
            Delimiter.height(16),
            EnsureVisibleWhenFocused(
              focusNode: _userNameFocus,
              child: _buildThemedFormField(
                child: TextFormField(
                  controller: viewModel!.userNameController,
                  focusNode: _userNameFocus,
                  decoration: DefaultInputDecoration(
                    labelText: str(context).usernameHint,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  maxLines: 1,
                  style: AppTextStyles.n18(colors().editTextColor),
                  validator: (value) =>
                      viewModel!.userNameValidator!.asValidator(context, value),
                  onSaved: (value) => viewModel?.userName = value!.trim(),
                  textInputAction: TextInputAction.go,
                  onFieldSubmitted: (value) =>
                      FocusScope.of(context).requestFocus(_passwordFocus),
                ),
              ),
            ),
            Delimiter.height(16),
            EnsureVisibleWhenFocused(
              focusNode: _passwordFocus,
              child: _buildThemedFormField(
                child: TextFormField(
                  controller: viewModel!.passwordController,
                  focusNode: _passwordFocus,
                  obscureText: true,
                  decoration: DefaultInputDecoration(
                    labelText: str(context).passwordHint,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  autofocus: false,
                  maxLines: 1,
                  style: AppTextStyles.n18(colors().editTextColor),
                  validator: (value) =>
                      viewModel!.passwordValidator!.asValidator(context, value),
                  onSaved: (value) => viewModel!.password = value!.trim(),
                ),
              ),
            ),
          ],
        ),
      );

  // Widget _buildRememberMeContent() => Container(
  //       child: Flexible(
  //         flex: 1,
  //         child: CustomCheckbox(
  //           value: localSettings().isRemember,
  //           text: str(context).rememberMe,
  //           onChanged: (value) async =>
  //               await localSettings().saveIsRemember(value),
  //         ),
  //       ),
  //     );

  Widget _buildLoginButton(BuildContext context) => AppButton.dark(
        title: str(context).btnLoginText,
        onPressed: _onSubmit(context),
      );

  VoidCallback _onSubmit(BuildContext context) => () async {
        if (_formKey.currentState!.validate()) {
          await dialogService().showProgressDialog(context);
          _formKey.currentState!.save();
          await dialogService().showProgressDialog(context);
          viewModel!.getApiKey(context);
          FocusScope.of(context).requestFocus(FocusNode());
        }
      };

  Widget _buildThemedFormField({required Widget child}) => Theme(
        data: Theme.of(context).copyWith(
          primaryColor: colors().primaryTextColorLight,
        ),
        child: child,
      );

  Widget _buildBlockedErrorText(BuildContext context, bool showError) =>
      showError
          ? Container(
              child: Text(
                viewModel!.userError,
                textAlign: TextAlign.center,
                style: AppTextStyles.n18(colors().errorColor),
              ),
            )
          : SizedBox();

  void _onLoginResult(LoginStatus result) async {
    await dialogService().hideProgressDialog();
    switch (result) {
      case LoginStatus.FIRST_LOGIN:
        _openNextScreen();
        break;
      case LoginStatus.DEFAULT_LOGIN:
        break;
      case LoginStatus.ERROR_OFFLINE_LOGIN:
        dialogService().showConnectionErrorDialog(context: context);
        break;
      case LoginStatus.ERROR_LOGIN:
        setState(() {
          _userError = true;
        });
        break;
    }
  }

  void _openNextScreen() {
    Navigator.of(context).pushReplacementNamed(AppRouter.dashboardScreen);
  }

  @override
  void onError(Exception e) async {
    await dialogService().hideProgressDialog();
    Logger.logTag(this.runtimeType, "e: ${e.toString()}");
    dialogService().showSimpleErrorDialog(context, e.toString());
  }
}
