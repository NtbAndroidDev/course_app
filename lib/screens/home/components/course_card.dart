import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive_animation/models/course.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key, required this.course});

  final Course course;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      height: 280,
      width: 260,
      decoration: BoxDecoration(
          color: course.color,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 8),
                    child: Text(
                      course.description,
                      style: TextStyle(color: Colors.white60),
                    ),
                  ),
                  Text("61 SECTIONS - 11 HOURS",
                      style: TextStyle(color: Colors.white54)),
                  Spacer(),
                  Row(
                    children: List.generate(
                        3,
                            (index) => Transform.translate(
                          offset: Offset((-10 * index).toDouble(), 0),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                                "assets/avaters/Avatar ${index + 1}.jpg"),
                          ),
                        )),
                  )
                ],
              )),
          SvgPicture.asset(course.iconSrc)
        ],
      ),
    );
  }
}

