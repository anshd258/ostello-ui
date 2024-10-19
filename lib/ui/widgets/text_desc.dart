import 'package:flutter/material.dart';
import 'package:ostello/core/extensions/buildcontext.dart';

class TextDesc extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() callback;
  const TextDesc(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            title,
            style: context.textTheme.labelSmall,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          TextButton(
            onPressed: callback,
            style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 4),
                visualDensity:
                    VisualDensity(vertical: VisualDensity.minimumDensity)),
            child: Text(
              subtitle,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorSchema.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: context.colorSchema.primary),
            ),
          ),
        ],
      ),
    );
  }
}
