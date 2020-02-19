import 'package:explore_pattern/page_route.dart';
import 'package:explore_pattern/utils.dart';
import 'package:flutter/material.dart';

class RootProviderActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ProviderState();
}

class ProviderState extends State<RootProviderActivity> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomPadding: true,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Utils().button("Simple Provider", () {
                  Navigator.of(context).pushNamed(linkSimpleProvider);
                }),
                Utils().button("Reusable", () {
                  Navigator.of(context).pushNamed(linkReusableProvider);
                }),
                Utils().button("Multi Provider", () {
                  Navigator.of(context).pushNamed(linkMultiProvider);
                }),
                Utils().button("Consumer", () {
                  Navigator.of(context).pushNamed(linkConsumer);
                }),
              ],
            )));
  }
}
