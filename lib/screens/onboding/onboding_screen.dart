import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import 'compenents/animated_btn.dart';
import 'compenents/sign_in_dialog.dart';
import 'compenents/sign_in_form.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSignInDialogShown = false;
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              width: MediaQuery.of(context).size.width * 1.7,
              bottom: 200,
              left: 100,
              child: Image.asset("assets/Backgrounds/Spline.png")),
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: const SizedBox(),
          )),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 50,
              sigmaY: 50,
            ),
            child: const SizedBox(),
          )),
          AnimatedPositioned(
            top: isSignInDialogShown? -50 : 0,
            duration: Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const SizedBox(
                    width: 260,
                    child: Column(
                      children: [
                        Text(
                          "Learn design & code",
                          style: TextStyle(
                              fontSize: 60, fontFamily: "Poppins", height: 1.2),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                            "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.")
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  AnimatedBtn(
                    btnAnimationController: _btnAnimationController,
                    press: () {
                      _btnAnimationController.isActive = true;
                      Future.delayed(Duration(milliseconds: 800), (){
                        setState(() {
                          isSignInDialogShown = true;
                        });
                        customSigninDialog(context, onClose: (value){
                          setState(() {
                            isSignInDialogShown = false;
                          });
                        });
                      });
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                        "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
                  )
                ],
              ),
            )),
          )
        ],
      ),
    );
  }

}
