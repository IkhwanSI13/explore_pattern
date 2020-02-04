import 'package:explore_pattern/provider/reusable/ReusableProviderNotifier.dart';
import 'package:explore_pattern/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//DO use ChangeNotifierProvider.value to provide an existing ChangeNotifier.
//MyChangeNotifier variable;
//
//ChangeNotifierProvider.value(
//  value: variable,
//  child: ...
//)

//FOR first iniate provider, or you will get memory leak
//MyChangeNotifier variable;
//
//ChangeNotifierProvider(
//  create: (_) => variable,
//  child: ...
//)

class ReusableProviderActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("CheckLog | ReusableProviderActivity | build method run");

    return Scaffold(
        appBar: AppBar(
          title: const Text('Reusable Provider'),
        ),
        body: ChangeNotifierProvider(
            create: (_) => new ReusableProviderNotifier(),
            child: ReusableProviderWidget()));
  }
}

///Widget 1
class ReusableProviderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ReusableProviderState();
}

class ReusableProviderState extends State<ReusableProviderWidget> {
  ReusableProviderNotifier notifier;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ReusableProviderNotifier>(context);
    print("CheckLog | ReusableProviderNotifier | build method run");

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomPadding: true,
            body: Container(
              margin: EdgeInsets.only(left: 24, top: 36, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("Widget 1"),
                  Text("Count: " + notifier.count.toString()),
                  Utils().button("ADD", () {
                    notifier.add();
                  }),
                  Utils().button("REMOVE", () {
                    notifier.remove();
                  }),
                  Reusable2ProviderWidget()
                ],
              ),
            )));
  }
}

///Widget 2
class Reusable2ProviderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new Reusable2ProviderState();
}

class Reusable2ProviderState extends State<Reusable2ProviderWidget> {
  ReusableProviderNotifier notifier;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ReusableProviderNotifier>(context);
    print("CheckLog | Reusable2ProviderNotifier | build method run");

    return Container(
      //TODO Explore - Without ChangeNotifierProvider.value, it is still run
      child: ChangeNotifierProvider.value(
        value: notifier,
        child: anotherWidget(),
      ),
    );
  }

  Widget anotherWidget() {
    return Container(
      margin: EdgeInsets.only(left: 24, top: 36, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text("Widget 2"),
          Text("Count on another widget: " + notifier.count.toString()),
          Utils().button("ADD", () {
            notifier.add();
          }),
          Utils().button("REMOVE", () {
            notifier.remove();
          }),
        ],
      ),
    );
  }
}
