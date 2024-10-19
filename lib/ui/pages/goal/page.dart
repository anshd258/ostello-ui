import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ostello/core/extensions/buildcontext.dart';
import 'package:ostello/main.dart';
import 'package:ostello/model/goalmodel.dart';
import 'package:ostello/ui/pages/goal/class/page.dart';

class GoalPage extends StatefulWidget {
  static const route = "/goal";
  static const routeName = "goal-page";
  const GoalPage({super.key});

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
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
                            onPressed: () {Navigator.pop(context);},
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
                                  text: "goal ",
                                  style: context.textTheme.titleLarge?.copyWith(
                                      color: context.colorSchema.primary,
                                      fontWeight: FontWeight.w700)),
                              TextSpan(
                                  text: "you want...",
                                  style: context.textTheme.bodyLarge)
                            ])),
                            Text(
                              "Goals can be changed at anytime later",
                              style: context.textTheme.bodySmall
                                  ?.copyWith(fontSize: 14),
                            )
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
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                children: [
                  _buildGoalTile('NEET', 'Class 11 | Class 12 | Class 12+',
                      "assets/book.png"),
                  _buildGoalTile('JEE', 'Class 11 | Class 12 | Class 12+',
                      "assets/board.png"),
                  _buildGoalTile('JEE', 'Class 11 | Class 12 | Class 12+',
                      "assets/lamp.png"),
                  _buildGoalTile('JEE', 'Class 11 | Class 12 | Class 12+',
                      "assets/book.png"),
                  _buildGoalTile('NEET', 'Class 11 | Class 12 | Class 12+',
                      "assets/board.png"),
                  _buildGoalTile('JEE', 'Class 11 | Class 12 | Class 12+',
                      "assets/lamp.png"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalTile(String title, String subtitle, String icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side:
                BorderSide(width: 1, color: Color.fromRGBO(231, 231, 231, 1))),
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
          subtitle: Text(subtitle),
          onTap: () {
            context.push(SelectClassPage.route,
                extra: Goalmodel(title: title, asset: icon));
          },
        ),
      ),
    );
  }
}
