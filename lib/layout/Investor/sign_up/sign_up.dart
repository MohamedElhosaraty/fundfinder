import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fundfinder/layout/Investor/login.dart';
import 'package:fundfinder/modules/splash.dart';
import 'package:fundfinder/shared/components.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_Up> {

  bool isPassword = false;
  bool isPassword1 = false;
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
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[300]
                  ),
                  prefixIcon:const Icon(
                    Icons.person,color: Colors.blueAccent,),
                ),
                const SizedBox(
                  height: 15,
                ),
                defaultTextFormFiled(
                  controller: emailController,
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[300]
                  ),
                  prefixIcon:const Icon(
                    Icons.email,color: Colors.blueAccent,),
                ),
               const SizedBox(
                  height: 15,
                ),
                defaultTextFormFiled(
                  labelText: 'Password',
                  obscureText: isPassword,
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[300]
                  ),
                  prefixIcon:const Icon(
                    Icons.lock,color: Colors.blueAccent,),
                  suffixIcon: isPassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                  onTap: (){
                    setState(() {
                      isPassword = !isPassword;
                    });
                  }
                ),
               const SizedBox(
                  height: 15,
                ),

                defaultTextFormFiled(
                  labelText: 'Confirm Password',
                  obscureText: isPassword1,
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[300]
                  ),
                    prefixIcon:const Icon(
                      Icons.lock,color: Colors.blueAccent,),
                    suffixIcon: isPassword1 ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                    onTap: (){
                      setState(() {
                        isPassword1 = !isPassword1;
                      });
                    }
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
                            navigateTo(context, LoginScreen());
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
