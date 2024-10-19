import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ostello/core/extensions/buildcontext.dart';

class TimerCallback extends StatefulWidget {
  final String title;

  final void Function() callback;
  const TimerCallback({super.key, required this.title, required this.callback});

  @override
  State<TimerCallback> createState() => _TimerCallbackState();
}

class _TimerCallbackState extends State<TimerCallback> {
  bool isTimerActive = false;
  int _remainingSeconds = 60;
  Timer? _timer;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    setState(() {
      isTimerActive = true;
      _remainingSeconds = 60;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          isTimerActive = false;
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.title,
            style: context.textTheme.labelMedium),
        TextButton(
          onPressed: isTimerActive
              ? null
              : () {
                  startTimer();
                },
          child: Text(
            isTimerActive ? 'Resend in ${_remainingSeconds}s' : 'Resend Now',
            style: context.textTheme.titleMedium?.copyWith(
                color: context.colorSchema.primary,
                decoration: TextDecoration.underline,
                decorationColor: context.colorSchema.primary),
          ),
        ),
      ],
    );
  }
}
