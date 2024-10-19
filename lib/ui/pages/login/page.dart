import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:iconsax/iconsax.dart';

import 'package:ostello/core/extensions/buildcontext.dart';
import 'package:ostello/ui/pages/forgot_passowrd/page.dart';

import 'package:ostello/ui/pages/otp/page.dart';
import 'package:ostello/ui/pages/signup/name/page.dart';
import 'package:ostello/ui/widgets/gradient_button.dart';
import 'package:ostello/ui/widgets/phone_field.dart';
import 'package:ostello/ui/widgets/text_desc.dart';

class LoginPage extends StatefulWidget {
  static const route = "/";
  static const routeName = "Login-page";
  final String? phoneNumber;
  const LoginPage({super.key, this.phoneNumber});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    if (widget.phoneNumber != null) {
      _controller.text = widget.phoneNumber!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_left)),
        centerTitle: true,
        title: Row(
          children: [
            const Gap(44),
            Image.asset(
              "assets/logo.png",
              height: 28,
              width: 28,
            ),
            const Gap(6),
            const Text('OSTELLO')
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      "assets/login.png",
                      height: 326,
                      width: 326,
                    ),
                  ),
                  const Gap(24),
                  Text(
                    "Login into your account",
                    style: context.textTheme.titleLarge,
                  ),
                  const Gap(8),
                  Text(
                    "Best Teacher | Affordable Pricing | Live Batches | DPP | Notes",
                    style: context.textTheme.bodySmall,
                  ),
                  const Gap(20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mobile Number",
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                  const Gap(4),
                  PhoneInputField(
                    ctr: _controller,
                    inputPhone: true,
                    length: 10,
                    maxlength: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 34),
              child: Column(
                children: [
                  GradientButton(
                    title: "Login",
                    callBack: () {
                      if (_controller.text.length == 10) {
                        context.push(OtpPage.route, extra: _controller.text);
                      }
                    },
                  ),
                  const Gap(16),
                  TextDesc(
                      title: "New to Ostello ?",
                      subtitle: "Signup",
                      callback: () {
                        context.push(SignupNamePage.route);
                      }),
                  const Gap(4),
                  TextDesc(
                      title: "Forgot Password ?",
                      subtitle: "reset",
                      callback: () {
                        context.push(ForgotPasswordpage.route);
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
