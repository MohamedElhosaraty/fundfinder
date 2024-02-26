import 'package:flutter/material.dart';
import 'package:fundfinder/model/onboard_model.dart';
import 'package:fundfinder/modules/welcome.dart';
import 'package:fundfinder/shared/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onborading_Screen extends StatefulWidget {
  Onborading_Screen({super.key});

  @override
  State<Onborading_Screen> createState() => _Onborading_ScreenState();
}

class _Onborading_ScreenState extends State<Onborading_Screen> {
  var controller = PageController();

  bool isLast = false;

  List<Boarding> boarding = [
    Boarding(
      image: "assets/images/image1.png",
      title: "GPS Monitoring",
      body:
          "   Gps monitoring to know where the\n blind is by the place where the roaia \n                      glasses in .",
    ),
    Boarding(
      image: "assets/images/image2.png",
      title: "SOS Notification",
      body:
          "We provide SOS notification if he fall in trouble \n there is a notification sent directly to app and\n the glasses take photo then sent them to app \n then escort can go to target place without any\n                     problem or obstacle. ",
    ),
    Boarding(
      image: "assets/images/image3.png",
      title: "Add Contact",
      body:
          "Add contact feature which make glasses know \n                           people front of it.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Welcome_Screen(),
                    ),
                    (route) => false);
              },
              child: Text('Skip'))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .70,
              child: PageView.builder(
                  onPageChanged: (index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  controller: controller,
                  physics: BouncingScrollPhysics(),
                  itemCount: boarding.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 170,
                        ),
                        Image.asset("${boarding[index].image}"),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "${boarding[index].title} ",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Color(0xff5095FF)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${boarding[index].body}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xffA8A29E),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  }),
            ),
            SmoothPageIndicator(
              controller: controller,
              effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 5,
                  activeDotColor: Colors.blueAccent),
              count: boarding.length,
            ),
            SizedBox(
              height: 32,
            ),
            defaultBottom(
              style: TextStyle(
                  fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white
              ),

                text: isLast ? "Follow" : "Next",
                onPressed: () {
                  if (isLast) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Welcome_Screen(),
                        ),
                        (route) => false);
                  } else {
                    controller.nextPage(
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                })
          ],
        ),
      ),
    );
  }
}
