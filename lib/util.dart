import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'cv.dart';

var style = TextStyle(
    color: titleColor,
    fontSize: 15,
    fontFamily: 'IranSans',
    fontWeight: FontWeight.w300);
const iconSize = 30.0;

Widget textIcon(var text, var icon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.network(
        icon,
        width: 20,
        height: 20,
        color: Colors.white,
      ),
      SizedBox(
        width: 8.0,
      ),
      Text(
        text,
        style: style,
      ),
    ],
  );
}

launchURL(var Url) async {
  if (await canLaunch(Url)) {
    await launch(Url);
  } else {
    throw 'cant launch';
  }
}
