import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ostello/core/extensions/buildcontext.dart';
import 'package:ostello/main.dart';
import 'package:ostello/model/goalmodel.dart';
import 'package:ostello/ui/pages/goal/customize/page.dart';

class SelectClassPage extends StatefulWidget {
  static const route = "/class";
  static const routeName = "class-page";
  final Goalmodel data;
  const SelectClassPage({super.key, required this.data});

  @override
  State<SelectClassPage> createState() => _SelectClassPageState();
}

class _SelectClassPageState extends State<SelectClassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.purple.shade50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Gap(14),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Iconsax.arrow_left,
                              size: 34,
                            ),
                            visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity),
                          ),
                        ),
                        const Gap(14),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "Select",
                                  style: context.textTheme.titleLarge?.copyWith(
                                      color: context.colorSchema.primary,
                                      fontWeight: FontWeight.w700)),
                              TextSpan(
                                  text: " the ",
                                  style: context.textTheme.bodyLarge),
                              TextSpan(
                                  text: "Class ",
                                  style: context.textTheme.titleLarge?.copyWith(
                                      color: context.colorSchema.primary,
                                      fontWeight: FontWeight.w700)),
                              TextSpan(
                                  text: "you are in...",
                                  style: context.textTheme.bodyLarge)
                            ])),
                          ],
                        ),
                      ],
                    ),
                    const Gap(34)
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 150,
            child: SizedBox(
              height: context.screenHeight,
              width: context.screenWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    _buildGoalTile(widget.data.title, widget.data.asset),
                    const Gap(25),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          "Select class",
                          style: context.textTheme.labelSmall,
                        ),
                      ),
                    ),
                    const Gap(6),
                    _buildClassTile("11th Class"),
                    _buildClassTile("12th Class"),
                    _buildClassTile("Dropper"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalTile(String title, String icon) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
              color: context.colorSchema.primary,
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.purple.shade100,
          child: Center(
            child: Image.asset(
              icon,
              height: 32,
              width: 32,
            ),
          ),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: Radio(
          value: true,
          groupValue: true,
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: context.colorSchema.primary,
          onChanged: (value) {},
        ),
        onTap: () {
          // Handle goal selection
        },
      ),
    );
  }

  Widget _buildClassTile(
    String title,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(width: 1, color: Color.fromRGBO(231, 231, 231, 1))),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.purple.shade100,
          child: Icon(Iconsax.personalcard),
        ),
        title: Text(title, style: context.textTheme.labelMedium),
        onTap: () {
          context.push(CustomizingPage.route);
        },
      ),
    );
  }
}
