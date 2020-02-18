import 'package:explore_pattern/provider/consumer_selector/ConsumerNotifier.dart';
import 'package:explore_pattern/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//NOT WORK LIKE THE DOC
class ConsumerActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("CheckLog | ConsumerActivity | build method run");

    return Scaffold(
        appBar: AppBar(
          title: const Text('Consumer'),
        ),
        body: ChangeNotifierProvider(
            create: (_) => new ConsumerNotifier(), child: ConsumerWidget()));
  }
}

class ConsumerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ConsumerState();
}

class ConsumerState extends State<ConsumerWidget> {
  ConsumerNotifier notifier;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ConsumerNotifier>(context);
    print("CheckLog | ConsumerState | build method run");

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomPadding: true,
            body: Container(
              margin: EdgeInsets.only(left: 24, top: 36, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Consumer<ConsumerNotifier>(
                    builder: (BuildContext context, ConsumerNotifier value,
                        Widget child) {
                      print("CheckLog | Consumer rebuild");
                      return Text("Count inside consumer: " +
                          notifier.countConsumer.toString());
                    },
                    //todo not show
                    child: Text("Count outside consumer: " + notifier.countConsumer.toString()),
                  ),
                  Selector<ConsumerNotifier, int>(
                    selector: (buildContext, notif) => notif.getSelector,
                    builder: (context, data, child) {
                      print("CheckLog | Selector rebuild");
                      return Text(
                          "Count selector: " + data.toString());
                    },
                  ),
                  Text("Count outside consumer value: " + notifier.countConsumer.toString()),
                  Text("Count outside selector value: " + notifier.countSelector.toString()),
                  Utils().button("ADD Consumer", () {
                    notifier.addConsumer();
                  }),
                  Utils().button("REMOVE Consumer", () {
                    notifier.removeConsumer();
                  }),
                  Utils().button("ADD Selector", () {
                    notifier.addSelector();
                  }),
                  Utils().button("REMOVE Selector", () {
                    notifier.removeSelector();
                  }),
                ],
              ),
            )));
  }
}

//Foo(
//  child: Consumer<A>(
//    builder: (_, a, child) {
//      return Bar(a: a, child: child);
//    },
//    child: Baz(),
//  ),
//)

//Selector<List, int>(
//  selector: (_, list) => list.length,
//  builder: (_, length, __) {
//    return Text('$length');
//  }
//);
