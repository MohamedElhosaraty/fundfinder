import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fundfinder/modules/onboarding.dart';
import 'package:fundfinder/shared/components/navigatorto.dart';
import 'package:fundfinder/shared/navigator2.dart';
import 'package:lottie/lottie.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      navigateAndFinish(context, Onborading_Screen());
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText('Found Finder',textStyle: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffFF1F26)
              ),
              ),

            ],
            isRepeatingAnimation: true,
          ),
          SizedBox(
            height: 50,
          ),
          Lottie.asset('assets/images/animation_splash.json'),

        ],
      ),
    );
  }
}