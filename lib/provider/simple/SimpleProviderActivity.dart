import 'package:explore_pattern/provider/simple/SimpleProviderNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SimpleProviderActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
            create: (_) => new ProviderNotifier(), child: SimpleProviderWidget()));

    //DO use ChangeNotifierProvider.value to provide an existing ChangeNotifier.
    //MyChangeNotifier variable;
    //
    //ChangeNotifierProvider.value(
    //  value: variable,
    //  child: ...
    //)

    //FOR first iniate provider
    //MyChangeNotifier variable;
    //
    //ChangeNotifierProvider(
    //  create: (_) => variable,
    //  child: ...
    //)
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
    print("CheckLog build method run");

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
                  button("ADD", () {
                    notifier.add();
                  }),
                  button("REMOVE", () {
                    notifier.remove();
                  }),
                ],
              ),
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
}
