import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View/CountryNewsPage.dart';

class CircleList extends StatefulWidget {
  final double w;
  final double h;
  final String title;
  final String abb;
  final String image;

  const CircleList({
    Key? key,
    required this.title,
    required this.image,
    required this.abb,
    required this.w,
    required this.h,
  }) : super(key: key);
  @override
  _CircleListState createState() => _CircleListState();
}

class _CircleListState extends State<CircleList> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: widget.h * 0.01, horizontal: widget.w * 0.01),
        height: widget.h * 0.13,
        width: widget.w * 0.13,
        child: GestureDetector(
          onTap: () {
            Get.to(() => CountryNews(),
                transition: Transition.rightToLeft,
                duration: Duration(milliseconds: 500),
                arguments: [widget.abb, widget.title]);
          },
          child: Image.asset(widget.image),
        ),
      ),
    );
  }
}
