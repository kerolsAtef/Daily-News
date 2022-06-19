import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/View/CategoryPage.dart';

class CardHorizontalList extends StatefulWidget {
  const CardHorizontalList(
      {Key? key,
      required this.w,
      required this.h,
      required this.url,
      required this.t})
      : super(key: key);

  final double w;
  final double h;
  final String url;
  final String t;

  @override
  State<CardHorizontalList> createState() => _CardHorizontalListState();
}

class _CardHorizontalListState extends State<CardHorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => CategoryPage(),
                transition: Transition.rightToLeft,
                duration: Duration(milliseconds: 500),
                arguments: widget.t);
          },
          child: Container(
            margin: EdgeInsets.all(widget.w * 0.01),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 5),
                    blurRadius: 10,
                  )
                ]),
            child: Image.network(
              widget.url,
            ),
          ),
        ),
        // Positioned.fill(
        //     child: Container(
        //   margin: EdgeInsets.all(5),
        //   alignment: Alignment.topLeft,
        //   child: Text(
        //     widget.t,
        //     style: TextStyle(
        //         fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        //   ),
        // ))
      ],
    );
  }
}
