import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ostello/core/constant/reset_mode.dart';
import 'package:ostello/core/extensions/buildcontext.dart';
import 'package:ostello/ui/pages/forgot_passowrd/checkmail/page.dart';
import 'package:ostello/ui/pages/forgot_passowrd/checkphone/page.dart';
import 'package:ostello/ui/pages/otp/page.dart';
import 'package:ostello/ui/widgets/global_appbar.dart';
import 'package:ostello/ui/widgets/gradient_button.dart';

class ForgotPasswordpage extends StatefulWidget {
  static const route = "/forgot-password";
  static const routeName = "forgot-password-page";
  const ForgotPasswordpage({super.key});

  @override
  State<ForgotPasswordpage> createState() => _ForgotPasswordpageState();
}

class _ForgotPasswordpageState extends State<ForgotPasswordpage> {
  TextEditingController _controller = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: globalAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        "assets/password.png",
                        height: 326,
                        width: 326,
                      ),
                    ),
                    const Gap(24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Forgot Password",
                            style: context.textTheme.titleLarge)
                      ])),
                    ),
                    const Gap(8),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter your registered email ID or Phone number",
                          style: context.textTheme.bodyMedium?.copyWith(
                              color: Color.fromRGBO(124, 124, 124, 1)),
                        )),
                    const Gap(20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email address or Phone number",
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                    const Gap(4),
                    TextFormField(
                      controller: _controller,
                      validator: (value) {
                        if (_validatePhoneOrEmail(value!)) {
                          return null;
                        }
                        return "The email address you provided is not associated with your account";
                      },
                      decoration: InputDecoration(
                        errorMaxLines: 2,
                        errorStyle: context.textTheme.bodySmall?.copyWith(
                          color: const Color.fromRGBO(225, 59, 48, 1),
                        ),
                        filled: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 12.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade500),
                        ),
                      ),
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 34),
              child: Column(
                children: [
                  GradientButton(
                    title: "Send Link",
                    callBack: () {
                      if (_key.currentState!.validate()) {
                        if (_phoneOrEmail(_controller.text) ==
                            ResetMode.email) {
                          context.push(CheckmailPage.route);
                        } else if (_phoneOrEmail(_controller.text) ==
                            ResetMode.phone) {
                          context.push(
                            CheckPhone.route,
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _validatePhoneOrEmail(String input) {
    final phoneRegex = RegExp(r'^[0-9]{10}$');

    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');

    return phoneRegex.hasMatch(input) || emailRegex.hasMatch(input);
  }

  ResetMode? _phoneOrEmail(String input) {
    final phoneRegex = RegExp(r'^[0-9]{10}$');

    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');

    return phoneRegex.hasMatch(input)
        ? ResetMode.phone
        : emailRegex.hasMatch(input)
            ? ResetMode.email
            : null;
  }
}
