import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fundfinder/shared/components.dart';
import 'package:lottie/lottie.dart';

class Welcome_Screen extends StatelessWidget {
  const Welcome_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         const SizedBox(
            height: 50,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextLiquidFill(
                text: 'Found Finder',
                waveColor: Colors.blueAccent,
                boxBackgroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                ),
                boxHeight: 200.0,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Lottie.asset('assets/images/animation_wel.json'),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              defaultBottom(
                width: MediaQuery.of(context).size.width*.40,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  text: 'Startup', onPressed: (){}),
              defaultBottom(
                  width: MediaQuery.of(context).size.width*.40,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                  text: 'Industry', onPressed: (){})
            ],
          ),
        ],
      ),
    );
  }
}
