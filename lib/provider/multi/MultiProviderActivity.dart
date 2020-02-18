import 'package:explore_pattern/provider/multi/Multi2Notifier.dart';
import 'package:explore_pattern/provider/multi/MultiNotifier.dart';
import 'package:explore_pattern/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiProviderActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("CheckLog | MultiProviderActivity | build method run");

    return Scaffold(
        appBar: AppBar(
          title: const Text('Multi Provider'),
        ),
        body: MultiProvider(providers: [
          ChangeNotifierProvider(create: (_) => MultiNotifier()),
          ChangeNotifierProvider(create: (_) => Multi2Notifier()),
        ], child: MultiProviderWidget()));
  }
}

class MultiProviderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MultiProviderState();
}

class MultiProviderState extends State<MultiProviderWidget> {
  MultiNotifier notifier;
  Multi2Notifier notifier2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<MultiNotifier>(context);
    notifier2 = Provider.of<Multi2Notifier>(context);
    print("CheckLog | MultiProviderState | build method run");

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
                  Container(
                    margin: EdgeInsets.only(left: 24, top: 36, right: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Count: " + notifier2.count.toString()),
                        Utils().button("ADD", () {
                          notifier2.add();
                        }),
                        Utils().button("REMOVE", () {
                          notifier2.remove();
                        }),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
