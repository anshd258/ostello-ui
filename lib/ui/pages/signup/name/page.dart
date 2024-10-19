import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ostello/core/extensions/buildcontext.dart';
import 'package:ostello/ui/pages/login/page.dart';
import 'package:ostello/ui/pages/signup/mobile/page.dart';

import 'package:ostello/ui/widgets/global_appbar.dart';
import 'package:ostello/ui/widgets/gradient_button.dart';
import 'package:ostello/ui/widgets/phone_field.dart';
import 'package:ostello/ui/widgets/text_desc.dart';

class SignupNamePage extends StatefulWidget {
  static const route = "/signup/name";
  static const routeName = "Signup-name-page";
  const SignupNamePage({super.key});

  @override
  State<SignupNamePage> createState() => _SignupNamePageState();
}

class _SignupNamePageState extends State<SignupNamePage> {
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 3.0;
    return Scaffold(
      appBar: globalAppBar(context),
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
                    child: Hero(
                      tag: "couple",
                      child: Image.asset(
                        "assets/couple.png",
                        height: 326,
                        width: 326,
                      ),
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
                      "Your name",
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                  const Gap(4),
                  PhoneInputField(
                    ctr: _controller,
                    length: 5,
                    inputPhone: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 34),
              child: Column(
                children: [
                  GradientButton(
                    title: "Next",
                    callBack: () {
                      if (_controller.text.length >= 5) {
                        context.push(
                          SignupEmail.route,
                        );
                      }
                    },
                  ),
                  const Gap(16),
                  TextDesc(
                      title: "Already have an account?",
                      subtitle: " Login",
                      callback: () {
                        context.go(LoginPage.route);
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
