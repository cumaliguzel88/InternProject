import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../theme/colors.dart';

class IntroPageThree extends StatelessWidget {
  const IntroPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorDeepPurpleFifty,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
                "https://lottie.host/21bcb697-3f15-4fea-b941-2d83d5d7112c/yKmmecdBbH.json"),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Upload Building Photo",
              style: TextStyle(
                  color: colorWhite, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
