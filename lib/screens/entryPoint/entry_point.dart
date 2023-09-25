import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/components/animated_bar.dart';
import 'package:rive_animation/components/menu_btn.dart';
import 'package:rive_animation/components/side_menu.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/models/rive_assets.dart';
import 'package:rive_animation/screens/home/home_screen.dart';
import 'package:rive_animation/utils/rive_utils.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  RiveAssets selectedBottomNav = bottomNavs.first;
  late SMIBool isSideBarClose;
  bool isSideMenuClosed = true;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;



  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );

    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              width: 288,
              left: isSideMenuClosed ? -288 : 0,
              height: MediaQuery.of(context).size.height,
              child: SideMenu()),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
                offset: Offset(animation.value * 288, 0),
                child: Transform.scale(
                    scale: scaleAnimation.value,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        child: const HomeScreen()))),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            left: isSideMenuClosed ? 0 : 220,
            top: 16,
            child: MenuBtn(
              riveOnInit: (artBoard) {
                StateMachineController controller = RiveUtils.getRiveController(
                    artBoard,
                    stateMachineName: "State Machine");
                isSideBarClose = controller.findSMI("isOpen") as SMIBool;
                isSideBarClose.value = true;
              },
              press: () {
                isSideBarClose.value = !isSideBarClose.value;
                if (isSideMenuClosed) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }

                setState(() {
                  isSideMenuClosed = isSideBarClose.value;
                });
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * animation.value),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
                color: backgroundColor2.withOpacity(0.8),
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                    bottomNavs.length,
                    (index) => GestureDetector(
                          onTap: () {
                            bottomNavs[index].input!.change(true);
                            if (bottomNavs[index] != selectedBottomNav) {
                              setState(() {
                                selectedBottomNav = bottomNavs[index];
                              });
                            }
                            Future.delayed(Duration(seconds: 1), () {
                              bottomNavs[index].input!.change(false);
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedBar(
                                  isActive:
                                      bottomNavs[index] == selectedBottomNav),
                              SizedBox(
                                  width: 36,
                                  height: 36,
                                  child: Opacity(
                                    opacity:
                                        bottomNavs[index] == selectedBottomNav
                                            ? 1
                                            : 0.5,
                                    child: RiveAnimation.asset(
                                      bottomNavs.first.src,
                                      artboard: bottomNavs[index].artBoard,
                                      onInit: (artBoard) {
                                        StateMachineController controller =
                                            RiveUtils.getRiveController(artBoard,
                                                stateMachineName:
                                                    bottomNavs[index]
                                                        .stateMachineName);
                                        bottomNavs[index].input = controller
                                            .findSMI("active") as SMIBool;
                                      },
                                    ),
                                  )),
                            ],
                          ),
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
