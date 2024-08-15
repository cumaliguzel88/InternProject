import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../theme/colors.dart';

class IntroPageFour extends StatelessWidget {
  const IntroPageFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorDeepPurpleFifty,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
                "https://lottie.host/b8e85960-6545-4d18-b5bf-38fbfc248e80/ZFT54peDEx.json"),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Let's Start",
              style: TextStyle(
                  color: colorWhite, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
