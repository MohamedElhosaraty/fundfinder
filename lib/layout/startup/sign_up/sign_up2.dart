import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fundfinder/layout/startup/login.dart';
import 'package:fundfinder/modules/splash.dart';
import 'package:fundfinder/shared/components.dart';

class Sign_Up2 extends StatefulWidget {
  const Sign_Up2({super.key});

  @override
  State<Sign_Up2> createState() => _Sign_up2State();
}

class _Sign_up2State extends State<Sign_Up2> {

  bool isPassword = false;
  GlobalKey<FormState> formState =  GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formState,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.80,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('  Found Finder',textStyle: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueAccent
                      ),
                      ),
                    ],
                    isRepeatingAnimation: true,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),

                defaultTextFormFiled(
                  labelText: 'Industry',
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[300]
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                defaultTextFormFiled(
                  labelText: 'Description',
                  obscureText: isPassword,
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[300]
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),
                defaultTextFormFiled(
                  controller: emailController,
                  labelText: 'Number of Employees',
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[300]
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                defaultTextFormFiled(
                    labelText: 'Investor',
                    obscureText: isPassword,
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[300]
                    ),
                ),

                SizedBox(
                  height: 100,
                ),
                defaultBottom(
                  style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white
                  ),
                  text: "Sign Up",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Splash_Screen(),));
                  },),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    text(text: 'Already have an Account?',color: Colors.black,),
                    InkWell(
                        onTap: (){
                            navigateTo(context, const Login_StartUp());
                        },
                        child: text(text: '     Login ',color: Colors.blueAccent,)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
