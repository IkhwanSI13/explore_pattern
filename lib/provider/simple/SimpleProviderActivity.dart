import 'package:explore_pattern/provider/simple/SimpleProviderNotifier.dart';
import 'package:explore_pattern/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SimpleProviderActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("CheckLog | SimpleProviderActivity | build method run");

    return Scaffold(
        appBar: AppBar(
          title: const Text('Simple Provider'),
        ),
        body: ChangeNotifierProvider(
            create: (_) => new ProviderNotifier(),
            child: SimpleProviderWidget()));
  }
}

class SimpleProviderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SimpleProviderState();
}

class SimpleProviderState extends State<SimpleProviderWidget> {
  ProviderNotifier notifier;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ProviderNotifier>(context);
    print("CheckLog | SimpleProviderState | build method run");

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomPadding: true,
            body: Container(
              margin: EdgeInsets.only(left: 24, top: 36, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("Count: " + notifier.count.toString()),
                  Utils().button("ADD", () {
                    notifier.add();
                  }),
                  Utils().button("REMOVE", () {
                    notifier.remove();
                  }),
                ],
              ),
            )));
  }
}
