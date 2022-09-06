import 'package:flutter/material.dart';
import 'package:flutter_login/constants/colors.dart';
import 'package:flutter_login/utils/responsive_util.dart';
import 'package:flutter_login/widgets/commons/custom_button.dart';
import 'package:flutter_login/widgets/commons/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback switchToRegisterPage;

  const LoginForm({Key? key, required this.switchToRegisterPage})
      : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isPasswordVisible = false;
  String _username = "";
  String _password = "";

  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController()
      ..addListener(() {
        setState(() {
          _username = _usernameController.text.trim();
        });
      });
    _passwordController = TextEditingController()
      ..addListener(() {
        setState(() {
          _password = _passwordController.text.trim();
        });
      });
  }

  bool get _isFormValid => _username.isNotEmpty && _password.isNotEmpty;

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder:(responsiveUtil)=> Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Column(
          children: [
            CustomTextField(
                placeholder: "Username",
                controller: _usernameController,
                prefixIcon: const Icon(
                  Icons.person,
                  color: themeColorDarkest,
                )),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              controller: _passwordController,
              hideText: !_isPasswordVisible,
              suffixIcon: IconButton(
                  onPressed: _toggleVisibility,
                  icon: Icon(_isPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined)),
              placeholder: "Password",
              prefixIcon: const Icon(
                Icons.key,
                color: themeColorDarkest,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: double.infinity,
                child: CustomButton(
                  onPressed: _tryLogin,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  label: "Login",
                  disabled: !_isFormValid,
                )),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: const Text("Forgot password?"),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Join us Now? "),
                InkWell(
                  onTap: widget.switchToRegisterPage,
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        color: themeColorDarkest,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _tryLogin() {
    //todo make an api call to login
  }

  void _toggleVisibility() {
    setState(() => _isPasswordVisible = !_isPasswordVisible);
  }
}
