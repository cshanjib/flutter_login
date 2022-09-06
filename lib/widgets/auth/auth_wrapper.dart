import 'package:flutter/material.dart';
import 'package:flutter_login/constants/colors.dart';
import 'package:flutter_login/utils/responsive_util.dart';
import 'package:flutter_login/widgets/auth/auth_curve.dart';
import 'package:flutter_login/widgets/auth/login_form.dart';
import 'package:flutter_login/widgets/auth/register_form.dart';
import 'package:flutter_login/widgets/commons/responsive_widgets.dart';

class AuthWrapper extends StatefulWidget {
  final bool isRegister;

  const AuthWrapper({Key? key, this.isRegister = false}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  late bool _isRegisterPage;

  @override
  void initState() {
    super.initState();
    _isRegisterPage = widget.isRegister;
  }

  void _switchPage({bool isRegisterPage = false}) {
    setState(() => _isRegisterPage = isRegisterPage);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (responsiveUtil) => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 900),
          color: Colors.white,
          child: Stack(
            children: [
              SingleChildScrollView(
                  child: RowOrColumn(
                showRow: !responsiveUtil.isMobile,
                columnMainAxisSize: MainAxisSize.min,
                children: [
                  ExpandedIf(
                      flex: 4,
                      expanded: !responsiveUtil.isMobile,
                      child: AuthCurve(
                        responsiveUtil: responsiveUtil,
                      )),
                  ExpandedIf(
                      flex: 5,
                      expanded: !responsiveUtil.isMobile,
                      child: _isRegisterPage
                          ? RegisterForm(
                              switchToLoginPage: () =>
                                  _switchPage(isRegisterPage: false),
                            )
                          : LoginForm(
                              switchToRegisterPage: () =>
                                  _switchPage(isRegisterPage: true),
                            ))
                ],
              )),
              Positioned(
                top: 10,
                right: 10,
                child: RawMaterialButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () => Navigator.of(context).pop(),
                  constraints: BoxConstraints.tight(const Size(22, 22)),
                  fillColor: responsiveUtil.value<Color>(
                      mobile: Colors.white,
                      desktop: themeColorDarkest,
                      tablet: themeColorDarkest),
                  shape: const CircleBorder(),
                  child: Icon(
                    Icons.close,
                    size: 20,
                    color: responsiveUtil.value<Color>(
                        mobile: themeColorDarkest,
                        desktop: Colors.white,
                        tablet: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
