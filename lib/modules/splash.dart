import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fundfinder/modules/onboarding.dart';
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
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => Onborading_Screen(),),
              (route) => false);
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
                  fontSize: 65,
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