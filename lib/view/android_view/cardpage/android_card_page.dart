import 'package:flutter/material.dart';

import 'package:monarch_mart/utils/colors.dart';
import 'package:monarch_mart/utils/widgets/card_profile_appbar.dart';

class AndroidCardPage extends StatelessWidget {
  const AndroidCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CardProfileAppBar(
              title: Text(
            "Your Card",
            style: TextStyle(color: Appcolors.primaryColor),
          )),
        ],
      ),
    );
  }
}