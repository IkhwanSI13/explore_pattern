import 'package:explore_pattern/bloc/bloc.dart';
import 'package:explore_pattern/bloc/provider.dart';
import 'package:flutter/material.dart';

class BlocActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("CheckLog | BlocActivity | build method run");

//    final bloc = Provider.of(context);
    final bloc = Bloc();
    return Scaffold(
      appBar: AppBar(
        title: Text("BLoC Pattern"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              initialData: 0,
              stream: bloc.counterValue,
              builder: (context, snapshot) => Text(
                '${snapshot.data}',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bloc.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
