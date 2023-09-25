import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MenuBtn extends StatelessWidget {
  const MenuBtn({
    super.key, required this.press, required this.riveOnInit,
  });

  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: EdgeInsets.only(left: 16),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 3),
                    blurRadius: 8)
              ]),
          child: RiveAnimation.asset(
            "assets/RiveAssets/menu_button.riv",
            onInit: riveOnInit,
          ),
        ),
      ),
    );
  }
}
