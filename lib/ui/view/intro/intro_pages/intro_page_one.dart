import 'package:binamod/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorDeepPurpleFifty,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
                "https://lottie.host/76f97265-5e92-4b25-ac3b-f2bfbb9a12fc/QKwM9SIgLY.json"),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Find Your Location",
              style: TextStyle(
                  color: colorWhite, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
