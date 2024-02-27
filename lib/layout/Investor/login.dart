import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundfinder/layout/Investor/sign_up/sign_up.dart';
import 'package:fundfinder/modules/splash.dart';
import 'package:rive/rive.dart';

import '../../shared/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isPassword = false;

  final emailController = TextEditingController();
  final passController = TextEditingController();

  final animationLink = 'assets/login-bear.riv';
  SMITrigger? failTrigger, successTrigger;
  SMIBool? isHandsUp, isChecking;
  SMINumber? lookNum;
  StateMachineController? stateMachineController;
  Artboard? artboard;

  final correctEmail = 'Elhosaraty@gmail.com';
  final correctPassword = '123456';

  @override
  void initState() {
    rootBundle.load(animationLink).then((value) {
      final file = RiveFile.import(value);
      final art = file.mainArtboard;
      stateMachineController =
          StateMachineController.fromArtboard(art, "Login Machine");

      if (stateMachineController != null) {
        art.addController(stateMachineController!);

        stateMachineController!.inputs.forEach((element) {
          if (element.name == "isChecking") {
            isChecking = element as SMIBool;
          } else if (element.name == "isHandsUp") {
            isHandsUp = element as SMIBool;
          } else if (element.name == "trigSuccess") {
            successTrigger = element as SMITrigger;
          } else if (element.name == "trigFail") {
            failTrigger = element as SMITrigger;
          } else if (element.name == "numLook") {
            lookNum = element as SMINumber;
          }
        });
      }
      setState(() => artboard = art);
    });
    super.initState();
  }

  void lookAround() {
    isChecking?.change(true);
    isHandsUp?.change(false);
    lookNum?.change(0);
  }

  void moveEyes(value) {
    lookNum?.change(value.length.toDouble());
  }

  void handsUpOnEyes() {
    isHandsUp?.change(true);
    isChecking?.change(false);

  }

  void loginClick() {
    isChecking?.change(false);
    isHandsUp?.change(false);
    if (emailController.text == correctEmail &&
        passController.text == correctPassword) {
      successTrigger?.fire();
    } else {
      failTrigger?.fire();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (artboard != null)
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: Rive(artboard: artboard!),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child:  defaultTextFormFiled(
                  onTap: lookAround,
                  onChanged: ((value) => moveEyes(value)),
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
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: defaultTextFormFiled(
                    onTap: handsUpOnEyes,
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
                  onTap1: (){
                    setState(() {
                      isPassword = !isPassword;
                    });
                  }

                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: defaultBottom(
                  color: Color(0xffb73e60),
                  style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white
                  ),
                  text: "Sign Up",
                  onPressed: () {
                    loginClick();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Splash_Screen(),));
                  },),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    text(text: 'Don\'t have an Account?',color: Colors.black,),
                    InkWell(
                        onTap: (){
                           navigateTo(context, Sign_Up());
                        },
                        child: text(text: '     Sign Up ',color: Colors.blueAccent,)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}