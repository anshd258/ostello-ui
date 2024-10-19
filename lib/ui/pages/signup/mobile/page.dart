import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ostello/core/extensions/buildcontext.dart';
import 'package:ostello/ui/pages/otp/page.dart';
import 'package:ostello/ui/widgets/global_appbar.dart';
import 'package:ostello/ui/widgets/gradient_button.dart';
import 'package:ostello/ui/widgets/phone_field.dart';
import 'package:ostello/ui/widgets/text_desc.dart';

class SignupEmail extends StatefulWidget {
  static const route = "/signup/email";
  static const routeName = "Signup-email-page";
  const SignupEmail({super.key});

  @override
  State<SignupEmail> createState() => _SignupEmailState();
}

class _SignupEmailState extends State<SignupEmail> {
  TextEditingController _controller = TextEditingController();
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
              child: Column(
                children: [
                  Expanded(
                    child: Hero(
                      tag: "couple",
                      child: Image.asset(
                        "assets/phone.png",
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
                      "Mobile Number",
                      style: context.textTheme.titleMedium,
                    ),
                  ),
                  const Gap(4),
                  PhoneInputField(
                    ctr: _controller,
                    length: 10,
                    inputPhone: true,
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
                    title: "Send OTP",
                    callBack: () {
                      if (_controller.text.length == 10) {
                        context.push(OtpPage.route, extra: _controller.text);
                      }
                    },
                  ),
                  const Gap(16),
                  TextDesc(
                      title: "By creating an account, you agree to our ",
                      subtitle: " Term and Conditions",
                      callback: () {})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
