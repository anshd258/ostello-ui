import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ostello/core/extensions/buildcontext.dart';
import 'package:ostello/ui/widgets/global_appbar.dart';
import 'package:ostello/ui/widgets/gradient_button.dart';
import 'package:ostello/ui/widgets/text_desc.dart';

class CheckPhone extends StatelessWidget {
  static const route = "/check-phone";
  static const routeName = "Check-phone-page";
  const CheckPhone({super.key});

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
                    child: Image.asset(
                      "assets/sms.png",
                      height: 326,
                      width: 326,
                    ),
                  ),
                  const Gap(24),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Check your Phone",
                        style: context.textTheme.titleLarge)
                  ])),
                  const Gap(8),
                  Text(
                    "We’ve sent password recovery instruction to you via SMS",
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: const Color.fromRGBO(124, 124, 124, 1)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 34),
              child: Column(
                children: [
                  GradientButton(
                    title: "Open Messages App",
                    callBack: () {},
                  ),
                  const Gap(8),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Will do it later",
                        style: context.textTheme.labelMedium
                            ?.copyWith(color: context.colorSchema.primary),
                      )),
                  const Gap(8),
                  TextDesc(
                    callback: () {},
                    title: "No instructions on your number? ",
                    subtitle: "Resend",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
