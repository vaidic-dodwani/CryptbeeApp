import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cryptbee/Utilities/logInButton.dart';
import 'package:cryptbee/Utilities/logoWithName.dart';
import 'package:cryptbee/Utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    List items = [
      ["assests/illustrations/dancing_man.svg", "Trade anywhere anytime"],
      ["assests/illustrations/teaching_woman.svg", "Trade crypto with ease."],
      ["assests/illustrations/shopping_woman.svg", "Transact fast and easy"]
    ];
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assests/background.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Column(
            children: [
              const SizedBox(height: 37),
              const CenterLogo(),
              const SizedBox(height: 45),
              // const SizedBox(height: 404),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            items[index][0],
                            width: 328,
                            height: 328,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              items[index][1],
                              style: titleLarge(),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    viewportFraction: 1.2,
                    autoPlay: true,
                    autoPlayCurve: Curves.easeInOutSine,
                    autoPlayAnimationDuration: const Duration(seconds: 3),
                    height: 404,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),

              const SizedBox(height: 38),
              logInButton(text: "Login"),
              const SizedBox(height: 38),
              GestureDetector(
                onTap: (() {
                  log("skip");
                }),
                child: Text(
                  "Skip",
                  style: titleMedium(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

List<Widget> carousel_items = [
  Column(
    children: [
      SvgPicture.asset("assests/illustrations/dancing_man.svg"),
      Align(
        alignment: Alignment.bottomCenter,
        child: Center(
          child: Text(
            "ad",
            style: titleLarge(),
          ),
        ),
      )
    ],
  ),
  Column(
    children: [
      SvgPicture.asset("assests/illustrations/teaching_woman.svg"),
      Align(
        alignment: Alignment.bottomCenter,
        child: Center(
          child: Text(
            "Trade crypto with ease.",
            style: titleLarge(),
          ),
        ),
      )
    ],
  ),
  Column(
    children: [
      SvgPicture.asset("assests/illustrations/shopping_woman.svg"),
      Align(
        alignment: Alignment.bottomCenter,
        child: Center(
          child: Text(
            "Transact fast and easy",
            style: titleLarge(),
          ),
        ),
      )
    ],
  ),
];
