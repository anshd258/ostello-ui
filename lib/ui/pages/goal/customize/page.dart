import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ostello/core/extensions/buildcontext.dart';
import 'package:ostello/ui/widgets/global_appbar.dart';

class CustomizingPage extends StatelessWidget {
  static const route = "/custom";
  static const routeName = "custom-page";
  const CustomizingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: globalAppBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/sitting.png",
            height: 326,
            width: 326,
          ),
          const Gap(24),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "Customizing ",
                      style: context.textTheme.titleLarge),
                  TextSpan(
                      text: "OSTELLO",
                      style: context.textTheme.titleLarge
                          ?.copyWith(color: context.colorSchema.primary)),
                  TextSpan(
                      text: " app as per your selection",
                      style: context.textTheme.titleLarge)
                ])),
          ),
        ],
      ),
    );
  }
}
