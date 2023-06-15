import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_seed/common_widgets/custom_card.dart';
import 'package:flutter_seed/config/routes/routes.dart';
import 'package:flutter_seed/config/themes/colors.dart';
import 'package:flutter_seed/utils/helper_functions/toast.dart';

import '../../../constants/app_constants.dart';
import '../blocs/authentication/authentication_bloc.dart';
import '../blocs/authentication/authentication_event.dart';
import '../blocs/authentication/authentication_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  var _passwordVisible = false;

  void toggleShowPassword() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: CustomColors.backgroundColor),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CustomCard(
                    childWidget: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 14,
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            child: Text(
                              AppLocalizations.of(context)!.loginHere,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ValueListenableBuilder(
                              valueListenable: _emailController,
                              builder: (context, TextEditingValue value, __) {
                                return TextField(
                                  maxLength: 100,
                                  decoration: InputDecoration(
                                      counterText: "",
                                      errorText: getEmailError(),
                                      errorMaxLines: 2,
                                      labelText:
                                          AppLocalizations.of(context)!.email,
                                      labelStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  onChanged: (value) {
                                    setState(() {
                                      checkEmailAndPasswordField();
                                    });
                                  },
                                  autocorrect: false,
                                );
                              }),
                          ValueListenableBuilder(
                              valueListenable: _passwordController,
                              builder: (context, TextEditingValue value, __) {
                                return TextField(
                                  maxLength: 12,
                                  decoration: InputDecoration(
                                      counterText: "",
                                      errorText: getPasswordError(),
                                      errorMaxLines: 5,
                                      suffixIcon: IconButton(
                                        icon: _passwordVisible
                                            ? const Icon(Icons.visibility_off)
                                            : const Icon(Icons.visibility),
                                        onPressed: toggleShowPassword,
                                      ),
                                      labelText: AppLocalizations.of(context)!
                                          .password,
                                      labelStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                  obscureText: !_passwordVisible,
                                  obscuringCharacter: '*',
                                  controller: _passwordController,
                                  onChanged: (value) {
                                    setState(() {
                                      checkEmailAndPasswordField();
                                    });
                                  },
                                  autocorrect: false,
                                );
                              }),
                          BlocConsumer<AuthenticationBloc, AuthenticationState>(
                            listener: (context, state) {
                              if (state is AuthenticationErrorState) {
                                showToast(AppLocalizations.of(context)!
                                    .invalidEmailOrPassword);
                              }
                              if (state is AuthenticationSuccessState) {
                                showToast(AppLocalizations.of(context)!
                                    .loginSuccessfully);
                              }
                            },
                            builder: (context, state) {
                              return state is AuthenticationLoadingState
                                  ? Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      child: const Center(
                                          child: CircularProgressIndicator()),
                                    )
                                  : Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(top: 20),
                                      child: ElevatedButton(
                                        style: Theme.of(context)
                                            .elevatedButtonTheme
                                            .style,
                                        onPressed: checkEmailAndPasswordField()
                                            ? () {
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                                BlocProvider.of<
                                                            AuthenticationBloc>(
                                                        context)
                                                    .add(
                                                  LoginEvent(
                                                    _emailController.text
                                                        .trim(),
                                                    _passwordController.text,
                                                  ),
                                                );
                                              }
                                            : null,
                                        child: Text(
                                          AppLocalizations.of(context)!.login,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    );
                            },
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Routes.popAndPush(context, RoutePath.home);
                            },
                            style: TextButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    side: BorderSide(width: 0))),
                            child: Text(
                              AppLocalizations.of(context)!.skip,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? getEmailError() {
    var email = _emailController.text;
    if (email.length > 5 && !email.contains(RegExp(emailIdRegExp))) {
      return AppLocalizations.of(context)!.emailIsNotValid;
    } else {
      return null;
    }
  }

  String? getPasswordError() {
    var password = _passwordController.text;
    if (password.length > 7 && !password.contains(RegExp(passwordRegExp))) {
      return AppLocalizations.of(context)!.passwordIsNotValid;
    } else {
      return null;
    }
  }

  bool checkEmailAndPasswordField() {
    var email = _emailController.text;
    var password = _passwordController.text;
    if (email.isNotEmpty &&
        password.isNotEmpty &&
        email.length > 5 &&
        password.length > 7 &&
        getEmailError() == null &&
        getPasswordError() == null) {
      return true;
    } else {
      return false;
    }
  }
}
