import 'package:explore_pattern/page_route.dart';
import 'package:flutter/material.dart';

class MainActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MainState();
}

class MainState extends State<MainActivity> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomPadding: true,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                button("Provider", () {
                  Navigator.of(context).pushNamed(linkProvider);
                }),
                button("BLOC", () {
                  Navigator.of(context).pushNamed(linkBloc);
                }),
              ],
            )));
  }

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

//    Navigator.of(context).pushNamed(linkTopicList,
//        arguments: {param1: idTopic, param2: nameTopic});
}
