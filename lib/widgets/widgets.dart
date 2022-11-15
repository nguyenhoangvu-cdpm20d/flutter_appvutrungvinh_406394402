import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return Center(
    child: RichText(
      text: const TextSpan(style: TextStyle(fontSize: 50), children: <TextSpan>[
        TextSpan(
          text: 'Quiz',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: '',
              color: Colors.black54),
        ),
        TextSpan(
          text: 'VTV',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: '',
            color: Colors.pinkAccent,
          ),
        ),
      ]),
    ),
  );
}

Widget blueButton(
  BuildContext context,
  String label,
  /*buttonWidth*/
) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 18),
    decoration: BoxDecoration(
        color: Colors.pink, borderRadius: BorderRadius.circular(30)),
    alignment: Alignment.center,
    width: /* buttonWidth != null ? buttonWidth : */ MediaQuery.of(context)
            .size
            .width -
        48,
    child: Text(
      label,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
  );
}
