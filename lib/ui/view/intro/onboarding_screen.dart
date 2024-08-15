import 'package:binamod/ui/bottom_nav.dart';
import 'package:binamod/ui/theme/colors.dart';
import 'package:binamod/ui/view/intro/intro_pages/intro_page_four.dart';
import 'package:binamod/ui/view/intro/intro_pages/intro_page_one.dart';
import 'package:binamod/ui/view/intro/intro_pages/intro_page_three.dart';
import 'package:binamod/ui/view/intro/intro_pages/intro_page_two.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //first need a controller for page view where we are
  final PageController _controller = PageController();
  //I want to change if ı be in last page next to done
  bool _onLastPage = false; //set default
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //page view for intro
        PageView(
          //connected controller
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              _onLastPage = (index == 3);
            });
          },

          children: const [
            //add the pages
            IntroPageOne(),
            IntroPageTwo(),
            IntroPageThree(),
            IntroPageFour(),
          ],
        ),
        //dot indicators
        //The count = page count
        Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip text
                GestureDetector(
                  onTap: () {
                    //text skip move likely
                    _controller.jumpToPage(3);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(color: colorWhite, fontSize: 18),
                  ),
                ),

                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: WormEffect(
                      radius: 5.0,
                      spacing: 15.0,
                      activeDotColor: colorDeepPurple,
                      strokeWidth: 1.5),
                ),
                //next or done text
                _onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomNav()));
                        },
                        child: Text(
                          "Done",
                          style: TextStyle(color: colorWhite, fontSize: 18),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          //next  move likely
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(color: colorWhite, fontSize: 18),
                        ),
                      ),
              ],
            )),
      ],
    ));
  }
}
