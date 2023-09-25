import 'package:flutter/cupertino.dart';

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 200),
      margin:  EdgeInsets.only(bottom: 2),
      width: isActive ? 20: 0,
      height:   4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color(0xFF81B4FF),

      ),
    );
  }
}