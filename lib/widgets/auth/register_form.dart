import 'package:flutter/material.dart';
import 'package:flutter_login/constants/colors.dart';
import 'package:flutter_login/utils/responsive_util.dart';
import 'package:flutter_login/utils/validation_util.dart';
import 'package:flutter_login/widgets/commons/custom_button.dart';
import 'package:flutter_login/widgets/commons/custom_text_field.dart';

class RegisterForm extends StatefulWidget {
  final VoidCallback switchToLoginPage;
  const RegisterForm({Key? key, required this.switchToLoginPage}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String _username = "";
  String _password = "";
  String _email = "";
  String _confirmPassword = "";

  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _emailController;
  late final TextEditingController _confirmPasswordController;

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
    _emailController = TextEditingController()
      ..addListener(() {
        setState(() {
          _email = _emailController.text.trim();
        });
      });
    _confirmPasswordController = TextEditingController()
      ..addListener(() {
        setState(() {
          _confirmPassword = _confirmPasswordController.text.trim();
        });
      });
  }

  bool _isUsernameValid({bool skipEmpty = true}) =>
      _username.length >= 3 || (skipEmpty && _username.isEmpty);

  bool _isPasswordValid({bool skipEmpty = true}) =>
      _password.length >= 8 || (skipEmpty && _password.isEmpty);

  bool _isConfirmPasswordValid({bool skipEmpty = true}) =>
      _confirmPassword == _password || (skipEmpty && _confirmPassword.isEmpty);

  bool _isEmailValid({bool skipEmpty = true}) =>
      ValidationUtil.isValidEmail(_email) || (skipEmpty && _email.isEmpty);

  bool get _isFormValid =>
      _isUsernameValid(skipEmpty: false) &&
      _isPasswordValid(skipEmpty: false) &&
      _isConfirmPasswordValid(skipEmpty: false) &&
      _isEmailValid(skipEmpty: false);

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
                valid: _isUsernameValid(),
                errorText: "Invalid username",
                prefixIcon: const Icon(
                  Icons.person,
                  color: themeColorDarkest,
                )),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                placeholder: "Email",
                valid: _isEmailValid(),
                errorText: "Invalid email",
                controller: _emailController,
                prefixIcon: const Icon(
                  Icons.alternate_email_outlined,
                  color: themeColorDarkest,
                )),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: _passwordController,
              valid: _isPasswordValid(),
              errorText: "Password must of of at-least of 8 characters",
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
              height: 20,
            ),

            CustomTextField(
              controller: _confirmPasswordController,
              hideText: !_isConfirmPasswordVisible,
              valid: _isConfirmPasswordValid(),
              errorText: "Must match the password",
              suffixIcon: IconButton(
                  onPressed: _toggleConfirmPasswordVisibility,
                  icon: Icon(_isConfirmPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined)),
              placeholder: "Confirm Password",
              prefixIcon: const Icon(
                Icons.key,
                color: themeColorDarkest,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: CustomButton(
                  onPressed: _tryRegister,
                  label: "Register",
                  disabled: !_isFormValid,
                  padding: EdgeInsets.symmetric(vertical: responsiveUtil.defaultGap),
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Have Account? "),
                InkWell(
                  onTap: widget.switchToLoginPage,
                  child: const Text(
                    "Login",
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

  void _tryRegister() {
    //todo make an api call to register
  }

  void _toggleVisibility() {
    setState(() => _isPasswordVisible = !_isPasswordVisible);
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible);
  }
}
