import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';



AppBar globalAppBar(BuildContext context) {
  return AppBar(
      leading:
          IconButton(onPressed: () {Navigator.pop(context);}, icon: const Icon(Iconsax.arrow_left)),
      centerTitle: true,
      title: Row(
        children: [
          const Gap(44),
          Image.asset(
            "assets/logo.png",
            height: 28,
            width: 28,
          ),
          const Gap(6),
          const Text('OSTELLO')
        ],
      ),
    );
}