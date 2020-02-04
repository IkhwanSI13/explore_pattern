import 'package:explore_pattern/page_route.dart';
import 'package:explore_pattern/utils.dart';
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
                Utils().button("Provider", () {
                  Navigator.of(context).pushNamed(linkProvider);
                }),
                Utils().button("BLOC", () {
                  Navigator.of(context).pushNamed(linkBloc);
                }),
              ],
            )));
  }

//    Navigator.of(context).pushNamed(linkTopicList,
//        arguments: {param1: idTopic, param2: nameTopic});
}
