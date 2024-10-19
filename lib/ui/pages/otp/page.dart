import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ostello/core/extensions/buildcontext.dart';
import 'package:ostello/ui/pages/goal/page.dart';
import 'package:ostello/ui/pages/login/page.dart';
import 'package:ostello/ui/widgets/global_appbar.dart';
import 'package:ostello/ui/widgets/timer_callback.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  static const route = "/otp";
  static const routeName = "Otp-page";
  final String? phoneNumber;
  const OtpPage({super.key, this.phoneNumber});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
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
                      "assets/otp.png",
                      height: 326,
                      width: 326,
                    ),
                  ),
                  const Gap(24),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "OTP",
                        style: context.textTheme.titleLarge
                            ?.copyWith(color: context.colorSchema.primary)),
                    TextSpan(
                        text: "Verification",
                        style: context.textTheme.titleLarge)
                  ])),
                  const Gap(8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Enter the OTP sent to +91${widget.phoneNumber}",
                        style: context.textTheme.titleMedium,
                      ),
                      const Gap(2),
                      Icon(
                        Iconsax.edit,
                        size: 20,
                        color: context.colorSchema.primary.withOpacity(0.5),
                      )
                    ],
                  ),
                  const Gap(20),
                  OtpInput(),
                  const Gap(4),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 64),
              child: Column(
                children: [
                  TimerCallback(
                    title: "Didn’t receive the code?",
                    callback: () {},
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

class OtpInput extends StatelessWidget {
  OtpInput({super.key});
  final defaultPinTheme = PinTheme(
    margin: const EdgeInsets.symmetric(horizontal: 4),
    width: 60,
    height: 60,
    textStyle: GoogleFonts.sen(
        fontSize: 20,
        color: Color.fromRGBO(76, 68, 82, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(217, 217, 217, 1)),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: context.colorSchema.primary),
      borderRadius: BorderRadius.circular(10),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
    );
    return Pinput(
      length: 4,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (s) {
        return s == '1234' ? null : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => context.push(GoalPage.route),
    );
  }
}
