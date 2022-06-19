import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardVerticalList extends StatelessWidget {
  final double w;
  final double h;
  final String title;
  final String desc;
  final String imageToUrl;
  const CardVerticalList({
    Key? key,
    required this.title,
    required this.desc,
    required this.imageToUrl,
    required this.w,
    required this.h,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(w * 0.02),
        padding: EdgeInsets.all(w * 0.01),
        alignment: Alignment.center,
        width: w,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Color(0xff2428ab),
            boxShadow: [
              BoxShadow(
                offset: Offset(5, 0),
                blurRadius: 5,
              )
            ]),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: CachedNetworkImage(
                imageUrl: imageToUrl,
                width: w,
                fit: BoxFit.cover,
                height: h * 0.24,
                errorWidget: (context, url, error) => ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://cdn.vectorstock.com/i/1000x1000/85/43/error-page-not-found-vector-27898543.webp",
                    width: w,
                    fit: BoxFit.cover,
                    height: h * 0.24,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            Padding(
              padding: EdgeInsets.all(w * 0.025),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            Padding(
              padding: EdgeInsets.all(w * 0.02),
              child: Text(
                desc,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ));
  }
}
