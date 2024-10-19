import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ostello/core/extensions/buildcontext.dart';
import 'package:ostello/ui/widgets/global_appbar.dart';
import 'package:ostello/ui/widgets/gradient_button.dart';

class CheckmailPage extends StatelessWidget {
  static const route = "/check-mail";
  static const routeName = "Check-mail-page";
  const CheckmailPage({super.key});

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
                      "assets/mail.png",
                      height: 326,
                      width: 326,
                    ),
                  ),
                  const Gap(24),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Check your email",
                        style: context.textTheme.titleLarge)
                  ])),
                  const Gap(8),
                  Text(
                    "Password recovery instructions have been sent to your email",
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
                    title: "Open Email",
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
                  Text(
                    "No email? Check spam or retry with a valid email",
                    style: context.textTheme.labelSmall,
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
