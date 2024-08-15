import 'package:binamod/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorDeepPurpleFifty,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
                "https://lottie.host/a021af5b-006c-4ace-ba1b-74830a1c012c/eVtO6TafUS.json"),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Look Street View",
              style: TextStyle(
                  color: colorWhite, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
