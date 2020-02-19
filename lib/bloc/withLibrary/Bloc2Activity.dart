import 'package:explore_pattern/bloc/withLibrary/CounterBloc.dart';
import 'package:explore_pattern/utils.dart';
import 'package:flutter/material.dart';

/// with library
/// rxdart: 0.22.6

class Bloc2Activity extends StatefulWidget {
  @override
  _BlocState createState() => _BlocState();
}

class _BlocState extends State<Bloc2Activity> {
  CounterBloc _counterBloc = CounterBloc(0);

  @override
  Widget build(BuildContext context) {
    print("CheckLog | Bloc2Activity | build method run");

    return Scaffold(
      appBar: AppBar(
        title: Text("BLoC Pattern with RxDart"),
      ),
      body: SafeArea(
        child: Center(
          child: StreamBuilder<int>(
              stream: _counterBloc.counterObservable,
              builder: (context, snapshot) {
                return Text(
                  "${snapshot.data}",
                  style: Theme.of(context).textTheme.display2,
                );
              }),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Utils().button("add", () {
            _counterBloc.increment();
          }),
          Utils().button("remove", () {
            _counterBloc.decrement();
          })
        ],
      ),
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}
