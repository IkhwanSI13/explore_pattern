import 'package:explore_pattern/page_route.dart';
import 'package:explore_pattern/utils.dart';
import 'package:flutter/material.dart';

class RootBlocActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new BlocState();
}

class BlocState extends State<RootBlocActivity> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomPadding: true,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Utils().button("Simple Bloc", () {
                  Navigator.of(context).pushNamed(linkBloc);
                }),
                Utils().button("Bloc with library", () {
                  Navigator.of(context).pushNamed(linkBloc2);
                }),
              ],
            )));
  }
}
