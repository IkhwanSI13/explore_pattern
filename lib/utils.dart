import 'package:flutter/material.dart';

class Utils {
  Widget button(String text, Function onClick) {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Color(0xfff6f7eb),
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Color(0xff323031))),
            padding: EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 18.0),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
